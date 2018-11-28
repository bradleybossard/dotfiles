import os
import glob

# dir = '/Users/bradleybossard/test/shrink-pdf'
pdf_paths = dir + '/*.pdf'

for name in glob.glob(pdf_paths):
    basename = os.path.basename(name)
    parts = basename.split('-')
    title = parts[1].replace('_', ' -')
    print(title)
