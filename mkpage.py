#!/usr/bin/env python
"""Interpolate html codes into base.html to make pages."""

# standard library import
import os.path
import sys

def make_page(page_name):
    """Make an html page.

    Given a page name, this function looks up `head`, `body`, `foot`
    in the directory named by page name and compose these three
    sections into a static html.

    Args:
        page_name: A string indicating the output page. There must be
            a directory named by this string, and there must exist
            files named by `head`, `body`, `content`.

    """

    with open('base.html', 'r') as f:
        base_html = f.read()

    sections = {'head': '', 'body': '', 'foot': ''}
    for section in sections:
        filename = os.path.join(page_name, section)
        try:
            with open(filename, 'r') as f:
                sections[section] = f.read()
        except (OSError, IOError):
            print "Can't find", filename

    with open('%s.html' % page_name, 'w') as f:
        f.write(base_html.format(**sections))

def main(argv):

    if len(argv) < 2:
        print "usage: python %s page_name ..."
        exit(1)

    for p in argv[1:]:
        make_page(p)

if __name__ == "__main__":

    main(sys.argv)
