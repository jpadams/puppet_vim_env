### Overview

Note: This module has been rewritten for Puppet 4 and is not compatible with Puppet 3.x (should work with future parser). This module provides defined types to set up a vim envrionment optimized for Puppet development. It uses a solarized color scheme by default.

 - `<F2>` is mapped to align `=>` in a param block via Tabular
 - `,c<space>` to comment or uncomment via Nerdcommenter

It relies on the work done by many, many people and specifically draws upon the following resources:

https://github.com/MarcWeber/vim-addon-mw-utils

https://github.com/tomtom/tlib_vim

https://github.com/garbas/vim-snipmate

https://github.com/godlygeek/tabular

https://github.com/scrooloose/syntastic

https://github.com/rodjek/vim-puppet

https://github.com/honza/vim-snippets

https://github.com/altercation/vim-colors-solarized

https://github.com/scrooloose/nerdcommenter

It uses a custom fact, `homedir`, to decide where to put the .vimrc file and .vim directory.
Beware, this will clobber your existing `~/.vimrc`!

### Prerequisites

This module has been rewritten to assume the all-in-one, unified puppet-agent for PE and Open Source Puppet. It uses the Puppet 4 parser.
This module relies on a couple of modules from http://forge.puppetlabs.com. Which should be pulled in as dependencies by the Puppet Module Tool. If they are not because you're installing from github, you can install them yourself.

  - `puppet module install puppetlabs/vcsrepo`
  - `puppet module install puppetlabs/stdlib`

In case you were wondering, this module doesn't manage the `vim` package itself. It is assumed to be installed.
This module also assumes that the system you want vim enhancements for has `git` and `curl` installed.

### Installation & Setup

To begin using this module, install it in your master's codedir and write a profile (wrapper) to set up whatever user's vim environments you need. Classify agents with the profile (or a role containing it) and you're set.

For convenience or a quick test, there is a default config class in init.pp. So if you classify your machine with `puppet_vim_env` you'll get that default.

Alternatively, `puppet module install jpadams-puppet_vim_env` to an agent machine and `puppet apply -e 'include puppet_vim_env'` with the modulepath set if necessary.
