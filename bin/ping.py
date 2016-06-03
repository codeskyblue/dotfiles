#!/usr/bin/env python
#

import os
import sys
import urlparse


def main():
    if len(sys.argv) == 1:
        print 'Usage: {} <ip>'.format(sys.argv[0])
    
    url = sys.argv[1]
    if not url.startswith('http'):
        url = 'http://'+url
    u = urlparse.urlparse(url)
    os.system('ping ' + u.netloc)


if __name__ == "__main__":
    main()
