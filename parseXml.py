#!/usr/local/bin/python

import xml.etree.ElementTree
e = xml.etree.ElementTree.parse('tmp.xml').getroot()

print(e[4][0][0].attrib['src'])
