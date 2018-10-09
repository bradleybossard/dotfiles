import os
import glob

pattern = '[0-9][0-9][0-9][0-9]*.pdf'

for name in glob.glob(pattern):
    index = name.find('-')
    if index != -1:
        new_name = name[index+1:].replace('_', ' ').capitalize()
        os.rename(name, new_name)
