#!/usr/bin/env python
"""
scholarref.py:

This script searches an online database and returns a full BibTeX reference to
the command line for the publication most closely matching the query.

Usage:
    ./scholarref.py <query>

Example:
    ./scholarref.py water flow in glaciers
    @incollection{Hooke,
        doi = {10.1017/cbo9780511614231.012},
        publisher = {Cambridge University Press ({CUP})},
        pages = {197--251},
        author = {Roger LeB. Hooke},
        title = {Water flow in and under glaciers: geomorphic implications},
        booktitle = {Principles of Glacier Mechanics}
    }

Requirements are the `requests` Python library which can be installed with `pip
install requests`.

If you use Vim as your text editor, you can directly insert the output into the
current document with the following binding:
    nmap <leader>r :read !scholarref.py

Written by Anders Damsgaard, derived from doi2bib.py by Andrew Ning.
"""

import requests
import sys
import re

verbose = False

query = ' '.join(sys.argv[1:])
nhits = 1

# Use crossref metadata search (beta) to get the DOI
params = {'q': query, 'rows': str(nhits)}
doi_search_url = 'http://search.crossref.org/dois'
r = requests.get(doi_search_url, params=params)

dois = []
try:
    for j in r.json():
        dois.append(j['doi'].split('dx.doi.org/')[1])
except Exception as e:
    print('Error: ' + str(e))
    print('Maybe DOI service at ' + doi_search_url + ' is unavailable?')
    print('Server response: ' + str(r))
    sys.exit(1)

# get the DOI of the first result
doi = dois[0]
if verbose:
    print('Received DOI from ' + doi_search_url)

# fix escaped chars
doi = doi.replace('\\', '')


# use REST API (see http://crosscite.org/cn/)
headers = {'Accept': 'application/x-bibtex'}
r = requests.post('http://dx.doi.org/' + doi, headers=headers)
if verbose:
    print('Received bibtex entry from dx.doi.org')

# extract bibtex
r.encoding = 'utf-8'
bibtex = r.text
bibtex = bibtex.replace('&amp;', '&')
bibtex = bibtex.replace('\t', '    ')
bibtex = bibtex.replace('_', '', 1)  # strip _ from cite key
bibtex = re.sub('.*url.*\n', '', bibtex)  # remove url field
bibtex = re.sub('.*month.*\n', '', bibtex)  # remove month field

# appreviate journal names
bibtex = bibtex.replace('Journal', 'J.')
#bibtex = bibtex.replace('of ', '')
#bibtex = bibtex.replace('and ', '')
#bibtex = bibtex.replace('the ', '')
bibtex = bibtex.replace('Geophysical', 'Geophys.')
bibtex = bibtex.replace('Research', 'Res.')
bibtex = bibtex.replace('Letters', 'Lett.')
bibtex = bibtex.replace('Mechanics', 'Mech.')
bibtex = bibtex.replace('Glaciology', 'Glaciol.')
bibtex = bibtex.replace('Proceedings', 'Proc.')
bibtex = bibtex.replace('Royal', 'R.')
bibtex = bibtex.replace('Society', 'Soc.')
bibtex = bibtex.replace('Annals', 'Ann.')
bibtex = bibtex.replace('Resources', 'Resour.')
bibtex = bibtex.replace('Surface', 'Surf.')
bibtex = bibtex.replace('Processes', 'Proc.')
bibtex = bibtex.replace('National', 'Nat.')
bibtex = bibtex.replace('Computers', 'Comput.')
bibtex = bibtex.replace('Geotechnics', 'Geotech.')
bibtex = bibtex.replace('Academy', 'Acad.')
bibtex = bibtex.replace('Sciences', 'Sci.')
bibtex = bibtex.replace('Review', 'Rev.')
bibtex = bibtex.replace('Quaternary', 'Quat.')
bibtex = bibtex.replace('Physical', 'Phys.')
bibtex = bibtex.replace('Planetary', 'Planet.')
bibtex = bibtex.replace('Quarterly', 'Q.')
bibtex = bibtex.replace('Geological', 'Geol.')


bibtex = bibtex.strip()

if bibtex.find('<!DOCTYPE html>') != -1:
    sys.stderr.write('Entry not found\n')
else:
    print(bibtex.encode('utf-8'))
