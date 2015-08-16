# bundle.pp
define puppet_vim_env::bundle (
  String $owner,
  String $homedir
) {

  $bundledir = "${homedir}/.vim/bundle"

  file { $bundledir:
    ensure  => directory,
    owner   => $owner,
    require => File["${homedir}/.vim"],
  }

  $git_clones = {
    'tabular'              => 'https://github.com/godlygeek/tabular.git',
    'tlib_vim'             => 'https://github.com/tomtom/tlib_vim.git',
    'syntastic'            => 'https://github.com/scrooloose/syntastic.git',
    'vim-puppet'           => 'https://github.com/rodjek/vim-puppet.git',
    'vim-snipmate'         => 'https://github.com/garbas/vim-snipmate.git',
    'vim-snippets'         => 'https://github.com/honza/vim-snippets.git',
    'vim-addon-mw-utils'   => 'https://github.com/MarcWeber/vim-addon-mw-utils.git',
    'vim-colors-solarized' => 'https://github.com/altercation/vim-colors-solarized.git',
  }

  $git_clones.each |$repo, $source| {
    vcsrepo { "${bundledir}/${repo}":
      ensure   => present,
      source   => $source,
      user     => $owner,
      provider => 'git',
      require  => File[$bundledir],
    }
  }

}
