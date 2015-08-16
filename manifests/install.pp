# install.pp
define puppet_vim_env::install (
  String $homedir = $::homedir,
  String $owner = $::id,
  String $colorscheme = 'solarized',
  String $puppetlint_opts = @(OPTS/L)
    --no-documentation-check \
    --no-80chars-check \
    --no-autoloader_layout-check\
    | OPTS
) {

  include puppet_vim_env::lint

  file { "${homedir}/.vim":
    ensure => directory,
    owner  => $owner,
  }

  puppet_vim_env::pathogen { "for ${owner} in ${homedir}":
    homedir         => $homedir,
    owner           => $owner,
    colorscheme     => $colorscheme,
    puppetlint_opts => $puppetlint_opts,
  }

  puppet_vim_env::bundle { "for ${owner} in ${homedir}":
    homedir => $homedir,
    owner   => $owner,
  }

}
