# bundle.pp
class puppet_vim_env::bundle ($homedir) {

  $bundledir = "${homedir}/.vim/bundle"

  file { $bundledir:
    ensure  => directory,
    require => File["${homedir}/.vim"],
  }

  $git_clones = {
    'vim-addon-mw-utils' => 'https://github.com/MarcWeber/vim-addon-mw-utils.git',
    'tlib_vim'           => 'https://github.com/tomtom/tlib_vim.git',
    'vim-snipmate'       => 'https://github.com/garbas/vim-snipmate.git',
    'tabular'            => 'https://github.com/godlygeek/tabular.git',
    'syntastic'          => 'https://github.com/scrooloose/syntastic.git',
    'vim-puppet'         => 'https://github.com/rodjek/vim-puppet.git',
    'vim-snippets'       => 'https://github.com/honza/vim-snippets.git',
  }

  $git_clones.each |$repo, $source| {
    vcsrepo { "${bundledir}/${repo}":
      ensure   => present,
      source   => $source,
      provider => 'git',
      require  => File[$bundledir],
    }
  }

}
