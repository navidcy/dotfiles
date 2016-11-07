#!/usr/bin/env python
# encoding: utf-8
"""
derived from doi2bib.py by Andrew Ning on April 4, 2013
"""

import requests
import sys
import re


query = ' '.join(sys.argv[1:])
nhits = 1

# Use crossref metadata search (beta) to get the DOI
params = {'q': query, 'rows': str(nhits)}
r = requests.get('http://search.labs.crossref.org/dois', params=params)

dois = []
for j in r.json():
    dois.append(j['doi'].split('dx.doi.org/')[1])

# get the DOI of the first result
doi = dois[0]

# fix escaped chars
doi = doi.replace('\\', '')


# use REST API (see http://crosscite.org/cn/)
headers = {'Accept': 'application/x-bibtex'}
r = requests.post('http://dx.doi.org/' + doi, headers=headers)

# extract bibtex
r.encoding = 'utf-8'
bibtex = r.text
bibtex = bibtex.replace('&amp;', '&')
bibtex = bibtex.replace('\t', '    ')
bibtex = bibtex.replace('_', '', 1)  # strip _ from cite key
bibtex = re.sub('.*url.*\n', '', bibtex)  # remove url field
bibtex = re.sub('.*month.*\n', '', bibtex)  # remove month field
bibtex = bibtex.strip()

if bibtex.find('<!DOCTYPE html>') != -1:
    sys.stderr.write('Entry not found\n')
else:
    print(bibtex)
