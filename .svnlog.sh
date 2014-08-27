#!/bin/bash

escapeString() {
  newString=`echo $@ | sed 's/\:/\\\:/g' | sed 's/\-/\\\-/g'`
  echo $newString
}

# Get a list of my last commits for this directory and convert the timestamps to PST.
# This function is useful for filling in my timesheet.
svnlog () { 
  svn log | head -1000 | sed -n '/bbossard/,/-----$/ p' > svn.tmp
  dates_replace=$(cat svn.tmp | grep -v bbossard | sed 's/bbossard \| \(.*\) |/\1/')
  cat svn.tmp | grep bbossard | cut -d"|" -f3 | cut -d"(" -f1 > svn.dates.tmp

  while read line; do
    oldDate=$line
    newDate=$(TZ="America/Los_Angeles" date --date "$oldDate")

    escapeOldDate=$(escapeString $oldDate)
    escapeNewDate=$(escapeString $newDate)
    #echo $oldDate $newDate $escapeOldDate
    #echo sed "s/$escapeOldDate/$escapeNewDate/" -i svn.tmp 
    command="sed 's/$escapeOldDate/$escapeNewDate/' -i svn.tmp"
    #echo $command
    eval $command
  done < svn.dates.tmp
  rm svn.dates.tmp
  less svn.tmp
}

# Copy the last commit message to clipboard.
svnhead () {
  svn log -r HEAD | pbcopy
}
