import os
from jinja2 import Environment, FileSystemLoader, select_autoescape
import re
from io import StringIO
from json import dump as json_dump
from json import loads as json_loads
from json import load as json_load
import sbnt_parser
import collections
import itertools
import argparse


def jglobal(env):
    def ret(obj):
        env.globals[obj.__name__] = obj
        return obj
    return ret

def jfilter(env):
    def ret(obj):
        env.filters[obj.__name__] = obj
        return obj
    return ret

def jtest(env):
    def ret(obj):
        env.tests[obj.__name__] = obj
        return obj
    return ret

env = Environment(
    loader=FileSystemLoader("."),
    autoescape=select_autoescape(),
    keep_trailing_newline=True,
)

@jfilter(env)
def json(value):
    out = StringIO()
    json_dump(value, out, separators=(',',':'), ensure_ascii=False)
    return out.getvalue()

@jfilter(env)
def parse_json(value):
    return json_loads(value)

@jfilter(env)
def min_json(value):
    doc = json_loads(value)
    out = StringIO()
    json_dump(doc, out, separators=(',',':'), ensure_ascii=False)
    return out.getvalue()

@jfilter(env)
def min_sbnt(value):
    return str(sbnt_parser.parse(value))

@jfilter(env)
def sbnt_string(value):
    return sbnt_parser.sbnt_string(value)

roles_dir = '.'
@jglobal(env)
def get_roles(*editions):
    ret = collections.OrderedDict()
    for edition in editions:
        with open(os.path.join(roles_dir, f'roles.{edition}.json'), 'r') as f:
            doc = json_load(f)
            ret.update(doc)
    return ret

players = 8

@jglobal(env)
def num_players():
    return players

@jglobal(env)
def player_indices():
    return range(1, num_players()+1)

@jtest(env)
def is_role_type(value, type_name):
    key, values = value
    return values["type"] == type_name

@jglobal(env)
def chain(*iterables):
    return itertools.chain(*iterables)

def expand(path):
    output = env.get_template(path + '.jinja').render()
    with open(path, 'w') as f:
        f.write(f'# This file is generated from {path}.jinja. Do not edit.\n')
        f.write(output)

def main():
    global roles_dir
    global players

    parser = argparse.ArgumentParser()
    parser.add_argument('--players', type=int, default=8)
    parser.add_argument('--roles', default='.')
    parser.add_argument('unit', nargs='+')
    args = parser.parse_args()

    roles_dir = args.roles
    players = args.players
    for unit in args.unit:
        expand(unit)

if __name__ == '__main__':
    main()
