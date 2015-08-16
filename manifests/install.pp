# install.pp
define puppet_vim_env::install (
  String  $owner           = $::id,
  String  $homedir         = $::homedir,
  String  $colorscheme     = 'solarized',
  Boolean $clobber_vimrc   = true,
  String  $puppetlint_opts = @(OPTS/L)
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
    owner           => $owner,
    homedir         => $homedir,
    colorscheme     => $colorscheme,
    clobber_vimrc   => $clobber_vimrc,
    puppetlint_opts => $puppetlint_opts,
  }

  puppet_vim_env::bundle { "for ${owner} in ${homedir}":
    owner   => $owner,
    homedir => $homedir,
  }

}
