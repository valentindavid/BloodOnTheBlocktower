import re
from io import StringIO
import collections

def skip(input, start):
    while start < len(input) and input[start] in " \v\t\n\r":
        start += 1
    return start

class Compound:
    def __str__(self):
        ret = StringIO()
        ret.write('{')
        first = True
        for key, value in self.entries.items():
            if first:
                first = False
            else:
                ret.write(',')
            ret.write(str(key))
            ret.write(':')
            ret.write(str(value))
        ret.write('}')
        return ret.getvalue()

def parse_compound(input, start):
    if input[start] != '{':
        raise RuntimeError("Expected '{'")

    result = Compound()
    result.entries = collections.OrderedDict()

    start = skip(input, start + 1)
    if input[start] != '}':
        while True:
            key, start = parse_tag(input, start)
            start = skip(input, start)
            if input[start] != ':':
                raise RuntimeError("Expected ':'")
            value, start = parse_tag(input, start + 1)
            result.entries[key] = value
            start = skip(input, start)
            if input[start] == '}':
                break
            if input[start] != ',':
                raise RuntimeError("Expected ',' or '}'")
            start = skip(input, start + 1)

    return result, start + 1

class Number:
    def __str__(self):
        return f'{self.value}{self.type}'

number_pat = re.compile(r'(?P<value>[-+]?[0-9]*[.]?[0-9]*)(?P<type>[bsilfd]?)', re.IGNORECASE)
def parse_number(input, start):
    m = number_pat.match(input, start)
    if not m:
        raise RuntimeError("Cannot parse number")
    number = Number()
    number.type = m.group('type').upper()
    if number.type == '':
        number.type = 'I'
    number.value = m.group('value')

    return number, m.end(0)

class Array:
    def __str__(self):
        ret = StringIO()
        ret.write('[')
        ret.write(self.type)
        ret.write(';')
        first = True
        for value in self.values:
            if first:
                first = False
            else:
                ret.write(',')
            ret.write(str(value))
        ret.write(']')
        return ret.getvalue()


def parse_array(input, start):
    if input[start] != '[':
        raise RuntimeError("Expected '['")

    array = Array()
    array.type = input[start + 1].upper()
    array.values = []

    start = skip(input, start + 3)
    if input[start] != ']':
        while True:
            value, start = parse_number(input, start)
            if value.type != array.type:
                raise RuntimeError(f"Array type {array.type} is not matching element type {value.type}")
            array.values.append(value)
            start = skip(input, start)
            if input[start] == ']':
                break
            if input[start] != ',':
                raise RuntimeError("Expected ',' or '{'")
            start = skip(input, start + 1)

    return array, start + 1

class List:
    def __str__(self):
        ret = StringIO()
        ret.write('[')
        first = True
        for value in self.values:
            if first:
                first = False
            else:
                ret.write(',')
            ret.write(str(value))
        ret.write(']')
        return ret.getvalue()

def parse_list(input, start):
    if input[start] != '[':
        raise RuntimeError("Expected '['")

    list = List()
    list.values = []

    start = skip(input, start + 1)
    if input[start] != ']':
        while True:
            value, start = parse_tag(input, start)
            list.values.append(value)
            start = skip(input, start)
            if input[start] == ']':
                break
            if input[start] != ',':
                raise RuntimeError("Expected ',' or ']'")

            start = skip(input, start + 1)

    return list, start + 1

def parse_array_or_list(input, start):
    if input[start] != '[':
        raise RuntimeError("Expected '['")

    if len(input)-start >= 3 and input[start+1] in 'BbLlIi' and input[start+2] == ';':
        return parse_array(input, start)
    else:
        return parse_list(input, start)

simple_string_first = re.compile(r'[a-zA-Z_]')
simple_string = re.compile(r'[a-zA-Z_][a-zA-Z0-9_\-\.\+]*')

class String:
    def __str__(self):
        m = simple_string.match(self.string)
        m_first = simple_string_first.match(self.string)
        if m_first and m.end(0) == len(self.string):
            if self.string not in ['true', 'false']:
                return self.string
        ret = StringIO()
        quote = "'"
        if "'" in self.string and '"' not in self.string:
            quote = '"'
        ret.write(quote)
        for c in self.string:
            if c == '\n':
                ret.write('\\n')
            elif c == '\r':
                ret.write('\\r')
            elif c == '\t':
                ret.write('\\t')
            elif c == '\\':
                ret.write('\\\\')
            elif c == quote:
                ret.write('\\')
                ret.write(c)
            else:
                ret.write(c)
        ret.write(quote)
        return ret.getvalue()

def parse_simple_string(input, start):
    m = simple_string.match(input, start)
    if not m:
        raise RuntimeError("Expected string")
    value = String()
    value.string = m.group(0)
    if value.string in ['true', 'false']:
        n = Number()
        n.type = 'B'
        n.value = '1' if value.string=='true' else '0'
        return n, m.end(0)
    return value, m.end(0)

def parse_string(input, start):
    quote = input[start]
    start += 1
    buf = StringIO()
    value = String()

    while input[start] != quote:
        if input[start] == '\\':
            if input[start+1] == 'n':
                buf.write('\n')
                start += 2
            elif input[start+1] == 'r':
                buf.write('\r')
                start += 2
            elif input[start+1] == 't':
                buf.write('\t')
                start += 2
            elif input[start+1] == 'u':
                buf.write(bytes.fromhex(input[start+2:4]).decode('utf-16-le'))
                start += 6
            else:
                buf.write(input[start+1])
                start += 2
        else:
            buf.write(input[start])
            start += 1

    value = String()
    value.string = buf.getvalue()
    return value, start + 1

def parse_tag(input, start):
    while start < len(input) and input[start] in " \v\t\n\r":
        start += 1
    if start >= len(input):
        raise RuntimeError("Unexpected end of input")
    c = input[start]
    if c == '{':
        return parse_compound(input, start)
    elif c == '[':
        return parse_array_or_list(input, start)
    elif c in "'\"":
        return parse_string(input, start)
    elif c in "0123456789.+-":
        return parse_number(input, start)
    else:
        return parse_simple_string(input, start)

def parse(input):
    ret, end = parse_tag(input, 0)
    end = skip(input, end)
    if end != len(input):
        raise RuntimeError("Expected end of input")
    return ret

def sbnt_string(value):
    s = String()
    s.string = value
    return str(s)
