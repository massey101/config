#!/usr/bin/env python3

from urllib.request import Request, urlopen
import sys

import threading
from queue import Queue

q = Queue()

def increment(w):
    out = w
    found = "".join([ch for ch in w if ch.isdigit()])
    replace = (len(found), str(int(found)+1))
    out = out.replace(w, w.replace(found, replace[1].zfill(replace[0])))
    return out

def do_work(loc, filename):
    print("Downloading: " + filename)
    req = Request(loc + "/" + filename, headers={'User-Agent': 'Mozilla/5.0'})
    webpage = urlopen(req).read()
    with open(filename, "wb") as f:
        f.write(webpage)
    #urllib.request.urlretrieve(loc + "/" + filename, filename, headers={'User-Agent': 'Mozilla/5.0'})

# The worker thread pulls an item from the queue and processes it
def worker():
    while True:
        item = q.get()
        do_work(*item)
        q.task_done()

def main():
    if len(sys.argv) != 3:
        print("failed")
        return 1

    url = sys.argv[1]
    num = int(sys.argv[2])
    filename = url.split("/")[-1]
    loc = "/".join(url.split("/")[:-1])


    # Create the queue and thread pool.
    for i in range(num):
         t = threading.Thread(target=worker)
         t.daemon = True  # thread dies when main thread (only non-daemon thread) exits.
         t.start()

    # stuff work items on the queue (in this case, just a number).
    for item in range(num):
        q.put([loc, filename])
        filename = increment(filename)

    q.join()       # block until all tasks are done

if __name__ == '__main__':
    main()
