#!/usr/bin/env python

import sys
import json

data=open(sys.argv[1])

host=json.loads(data.readline())
host_parameters=json.loads(data.readline())
host_disklayout=json.loads(data.readline())

print "Host: %s" %host
print "Hostparameters: %s" %host_parameters
print "Host disklayout: %s" %host_disklayout
