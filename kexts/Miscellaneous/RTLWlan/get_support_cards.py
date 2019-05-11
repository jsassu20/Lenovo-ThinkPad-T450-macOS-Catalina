#!/usr/bin/env python2
# -*- coding:utf-8 -*-

import plistlib

def slimall(file):
    try:
        all=plistlib.readPlist(file)['IOKitPersonalities']
    except IOError:
        print "Read file error."

    print ' VID:PID  KeyName'
    for k,i in all.items():
        print '%04x:%04x %s' % (i['idVendor'], i['idProduct'], k)

slimall('/Library/Extensions/RtWlanU1827.kext/Contents/Info.plist')
