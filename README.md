> Modified version of [vim-pipenv](https://github.com/PieterjanMontens/vim-pipenv) to play nice with [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

## Usage Examples ##

See pipenv graph

    :PipenvYcm graph

As an example, install & lock `python-openctm` in dev packages

    :PipenvYcm install python-openctm --dev

Activate Pipenv venv for current file

    :PipenvYcm

Use \<tab\> to switch between available commands.

### Installing ###
vim-pipenv-ycm depends on [YouCompleteMe](https://github.com/Valloric/YouCompleteMe):

#### Using pathogen ####
First make sure you have [Pathogen](https://github.com/tpope/vim-pathogen), then
```shell
cd ~/.vim
mkdir -p bundle && cd bundle
git clone https://github.com/lejafar/vim-pipenv-ycm
# Install YouCompleteMe as well and 
git clone https://github.com/Valloric/YouCompleteMe
cd YouCompleteMe
./install.py --clang-completer
```
