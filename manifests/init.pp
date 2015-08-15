# init.pp
class puppet_vim_env (
  $homedir = $::homedir,
  $owner = $::id,
  $colorscheme = 'peachpuff',
  $puppetlint_opts = '--no-documentation-check --no-80chars-check --no-autoloader_layout-check'
) {

  include puppet_vim_env::lint

  file { "${homedir}/.vim":
    ensure => directory,
    owner  => $owner,
  }

  class { 'puppet_vim_env::pathogen':
    homedir         => $homedir,
    owner           => $owner,
    colorscheme     => $colorscheme,
    puppetlint_opts => $puppetlint_opts,
  }

  class { 'puppet_vim_env::bundle':
    homedir => $homedir,
    owner   => $owner,
  }

}
