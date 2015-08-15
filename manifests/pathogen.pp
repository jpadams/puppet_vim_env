# pathogen.pp
class puppet_vim_env::pathogen ($homedir, $puppetlint_opts) {

  $autoloaddir = "${homedir}/.vim/autoload"

  file { $autoloaddir:
    ensure  => directory,
    require => File[ "${homedir}/.vim" ],
  }

  file { "${autoloaddir}/pathogen.vim":
    ensure => file,
    source => 'puppet:///modules/puppet_vim_env/pathogen.vim',
  }

  file { "${homedir}/.vimrc":
    ensure => file,
    source => 'puppet:///modules/puppet_vim_env/vimrc',
  }

  file_line { 'manage puppet-lint options in vimrc':
    path  => "${homedir}/.vimrc",
    line  => "let g:syntastic_puppet_puppetlint_args=\'${puppetlint_opts}\'",
    match => '^let\ g\:syntastic_puppet_puppetlint_args\=',
  }

}

