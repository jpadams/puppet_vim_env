# init.pp
class puppet_vim_env (
  $homedir = $::homedir,
  $puppetlint_opts = '--no-documentation-check --no-80chars-check --no-autoloader_layout-check'
) {

  file { "${homedir}/.vim":
    ensure => directory,
  }

  class { 'puppet_vim_env::pathogen':
    homedir => $homedir,
  } ->

  class { 'puppet_vim_env::bundle':
    homedir => $homedir,
  }

}
