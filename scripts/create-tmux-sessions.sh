curr_dir=`pwd`
cd ~/src
for name in $(ls); do
  cd $name
  echo $name
  tmux -2 new-session -d -s $name
  cd -
done;
cd $curr_dir
