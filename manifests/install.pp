# install.pp
define puppet_vim_env::install (
  String  $owner            = $::id,
  String  $homedir          = $::homedir,
  String  $colorscheme      = 'solarized',
  Boolean $clobber_vimrc    = true,
  Boolean $remap_esc_jk     = false,
  Boolean $use_vim_airline  = false,
  String  $raw_vimrc_extras = '',
  String  $puppetlint_opts  = @(OPTS/L)
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
    owner            => $owner,
    homedir          => $homedir,
    colorscheme      => $colorscheme,
    clobber_vimrc    => $clobber_vimrc,
    remap_esc_jk     => $remap_esc_jk,
    use_vim_airline  => $use_vim_airline,
    raw_vimrc_extras => $raw_vimrc_extras,
    puppetlint_opts  => $puppetlint_opts,
  }

  puppet_vim_env::bundle { "for ${owner} in ${homedir}":
    owner           => $owner,
    homedir         => $homedir,
    use_vim_airline => $use_vim_airline,
  }

}
