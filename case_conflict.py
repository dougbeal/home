#!/usr/bin/env python

import os

for root, dirs, files in os.walk('.'):
    content = dirs + files
    for s1 in content:
        for s2 in content:
            if s1 != s2 and s1.lower() == s2.lower():
                print os.path.join(root,s1)
