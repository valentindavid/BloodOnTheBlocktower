import json
import tempfile
import os
import shutil
import zipfile
import argparse


def merge_docs(source, destination):
    if isinstance(source, dict) and isinstance(destination, dict):
        output = {}
        output.update(destination)
        for k, v in source.items():
            if k not in destination:
                output[k] = v
            else:
                output[k] = merge_docs(v, destination[k])
        return output
    if isinstance(source, list) and isinstance(destination, list):
        output = []
        output.extend(source)
        output.extend(destination)
        return output
    else:
        raise RuntimeError(f"Cannot merge {source} to {destination}")

def merge_json(source, destination):
    with open(source, 'r') as f:
        sdoc = json.load(f)
    with open(destination, 'r') as f:
        ddoc = json.load(f)

    outdoc = merge_docs(sdoc, ddoc)

    with tempfile.NamedTemporaryFile(mode='w', dir=os.path.dirname(destination)) as output:
        json.dump(outdoc, output)
        os.unlink(destination)
        os.link(output.name, destination)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('output')
    parser.add_argument('main')
    parser.add_argument('dependencies', nargs='*')
    args = parser.parse_args()

    with tempfile.TemporaryDirectory() as outdir:
        for datapack in [args.main] + args.dependencies:
            for root, dirs, files in os.walk(datapack):
                for f in files:
                    if f == 'pack.mcmeta' and not os.path.samefile(os.path.join(root, f), os.path.join(args.main, 'pack.mcmeta')):
                        continue
                    if f == 'README.md':
                        continue
                    if f.endswith("~") or f.endswith(".jinja") or f.endswith(".dep"):
                        continue
                    path = os.path.join(root, f)
                    relpath = os.path.relpath(path, datapack)
                    dest_path = os.path.join(outdir, relpath)
                    if os.path.exists(dest_path):
                        if f.endswith(".json"):
                            merge_json(path, dest_path)
                        else:
                            raise RuntimeError(f"Conflict with {path}")
                    else:
                        os.makedirs(os.path.dirname(dest_path), exist_ok=True)
                        shutil.copyfile(path, dest_path)

        with tempfile.NamedTemporaryFile(dir='.') as outfile:
            with zipfile.ZipFile(outfile, 'w') as zip:
                for root, dirs, files in os.walk(outdir):
                    dirrel = os.path.relpath(root, outdir)
                    dirinfo = zipfile.ZipInfo.from_file(root, dirrel)
                    dirinfo.CRC = 0
                    zip.mkdir(dirinfo)
                    for f in files:
                        path = os.path.join(root, f)
                        relpath = os.path.relpath(path, outdir)
                        zip.write(path, relpath)
                if os.path.exists(args.output):
                    os.unlink(args.output)
                os.link(outfile.name, args.output)

if __name__ == '__main__':
    main()
