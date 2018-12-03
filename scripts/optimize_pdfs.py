import os
import glob
from shutil import copyfile

# dir = '/Users/bradleybossard/test/shrink-pdf'
dir = '.'
pdf_paths = dir + '/*.pdf'
target_path = dir + '/renamed/'


if not os.path.exists(target_path):
    os.makedirs(target_path)

for name in glob.glob(pdf_paths):
    basename = os.path.basename(name)
    parts = basename.split('-')
    title = parts[1].replace('_', ' -')
    print(title)
    target_name = target_path + title + '.pdf'
    copyfile(name, target_name)
