#!/usr/bin/python3.11

from xml.etree import ElementTree
import re
import json
from tqdm import tqdm

tree = ElementTree.parse("simplewiki-20190101-pages-articles-multistream.xml")
root = tree.getroot()

num_documents = 0
num_docs_containing_word = {}
for page in tqdm(root.findall("{http://www.mediawiki.org/xml/export-0.10/}page")):
  revision = page.find("{http://www.mediawiki.org/xml/export-0.10/}revision")
  text = revision.find("{http://www.mediawiki.org/xml/export-0.10/}text")
  if text.text is None:
    continue
  num_documents += 1
  this_doc_contains_word = set()
  for match in re.finditer(r"\b(\w+'?\w*)\b", text.text.lower()):
    word = match.group(1)
    if word in this_doc_contains_word:
      continue
    this_doc_contains_word.add(word)
    if word not in num_docs_containing_word:
      num_docs_containing_word[word] = 0
    num_docs_containing_word[word] += 1


with open("idf.json", "w") as fp:
  fp.write(json.dumps({
    "num_docs": num_documents,
    "document_frequency": num_docs_containing_word
  }))