### Overview

This module sets up a vim envrionment optimized for Puppet development.

It relies on the work done by many, many people and specifically draws upon the following resources:

https://github.com/MarcWeber/vim-addon-mw-utils

https://github.com/tomtom/tlib_vim

https://github.com/garbas/vim-snipmate

https://github.com/godlygeek/tabular

https://github.com/scrooloose/syntastic

https://github.com/rodjek/vim-puppet

https://github.com/honza/vim-snippets

It uses a custom fact, `homedir`, to decide where to put the .vimrc file and .vim directory.
Beware, this will clobber your existing `~/.vimrc`!

### Prerequisites

This module relies on a couple of modules from http://forge.puppetlabs.com. Which should be pulled in as dependencies by the Puppet Module Tool. If they are not, you can install them yourself.

* For PE:
  - `puppet module install puppetlabs/pe_gem`
* For any Puppet install including PE:
  - `puppet module install puppetlabs/vcsrepo`
  - `puppet module install puppetlabs/stdlib`

This module also assumes that the system you want vim enhancements for has `git`, `curl` and `rubygems` installed (though it uses the vendored PE gem executable if available).

### Installation & Setup

To begin using this module, install it on your master and classify nodes with it or `puppet module install jpadams-puppet_vim_env` to an agent machine and `puppet apply -e 'include puppet_vim_env'`.
