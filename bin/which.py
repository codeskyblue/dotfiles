#! /usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author:  hzsunshx
# Created: 2015-06-01 15:56

"""
find python lib path
"""

import os
import sys
import argparse

def find(libname):
    founds = []
    for path in sys.path:
        if not os.path.isdir(path) or path.startswith('.'):
            continue
        for tgtname in os.listdir(path):
            if tgtname.startswith('.'):
                continue
            name, ext = os.path.splitext(tgtname)
            if name == libname:
                yield os.path.join(path, tgtname)

if __name__ == '__main__':
    parser = argparse.ArgumentParser("find python package")
    parser.add_argument('pkgname', help='package name')
    args = parser.parse_args()
    paths = find(args.pkgname)
    for path in {}.fromkeys(paths).keys():
        print path
