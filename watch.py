#!/usr/bin/env python

# standard library imports
import os.path
import subprocess
import time

# third party related imports
from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer

# local library imports
import mkpage


class ChangeHandler(FileSystemEventHandler):

    def get_filename_spec(self, filename):

        dirname = os.path.dirname(filename)
        basename = os.path.basename(filename)

        return dirname, basename

    def compile_css(self):

        print "compile css"

        try:
            subprocess.check_call(['make', 'css'])
        except (OSError, subprocess.CalledProcessError):
            pass

    def make_page(self, dirname):

        print "make page", dirname
        mkpage.make_page(dirname)

    def on_any_event(self, event):

        if event.is_directory:
            return

        dirname, basename = self.get_filename_spec(event.src_path)
        ext = os.path.splitext(basename)[-1].lower()
        print dirname, basename, ext

        if ext == '.swp':
            return
        elif ext == '.less':
            self.compile_css()

        if basename in ('head', 'body', 'foot'):
            self.make_page(os.path.basename(dirname))


if __name__ == "__main__":

    event_handler = ChangeHandler()
    observer = Observer()
    observer.schedule(event_handler, path='.', recursive=True)
    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()

    observer.join()
