sudo apt-get install --yes curl zsh
chsh -s $(which zsh) $USER
rm -rf $HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom/plugins
git clone  https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/zsh-syntax-highlighting
git clone  https://github.com/lukechilds/zsh-better-npm-completion ${ZSH_CUSTOM}/zsh-better-npm-completion
# TODO: There is a startup error in this script
git clone  https://github.com/esc/conda-zsh-completion.git ${ZSH_CUSTOM}/conda
pushd ${ZSH_CUSTOM}/conda
cp _conda conda.plugin.zsh
popd
