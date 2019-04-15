> Modified version of [vim-pipenv](https://github.com/PieterjanMontens/vim-pipenv) to play nice with [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

## Usage Examples ##

Get help

    :help pipenv-ycm

See pipenv-ycm graph

    :Pipenv-ycm graph

Install & lock `pyyaml` in dev packages

    :Pipenv-ycm install pyyaml --dev

Activate Pipenv venv for current file

    :Pipenv-ycm

`:Pvv` is provided as alias for `:Pipenv-ycm`


Use \<tab\> to switch between available commands.

### Installing ###
vim-pipenv-ycm depends on the [YouCompleteMe](https://github.com/Valloric/YouCompleteMe):
make sure you install it too (or just follow guidelines bellow to install both at the same time)

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
