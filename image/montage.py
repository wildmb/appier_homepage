#!/usr/bin/env python

import subprocess
import sys

if __name__ == "__main__":

    if len(sys.argv) < 3:
        print "usage: python %s image1 image2 ... output" % sys.argv[0]
        exit(1)

    print sys.argv[1]

    input_images = sys.argv[1:-1]
    output_image = sys.argv[-1]

    try:
        cmd = [
                'montage', '-background', 'transparent', '-tile',
                '1x%s' % len(input_images), '-geometry', '+0+0',
        ]
        cmd.extend(sys.argv[1:])
        subprocess.check_call(cmd)

        if output_image.lower().endswith('.png'):
            cmd = [
                    'optipng', output_image
            ]
            try:
                subprocess.check_call(cmd)
            except OSError, subprocess.CalledProcessError:
                pass

    except subprocess.CalledProcessError as e:
        print unicode(e)
        exit(1)

    print "ok"
