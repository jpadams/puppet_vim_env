# pathogen.pp
class puppet_vim_env::pathogen (
  $homedir
  ) {

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
  
  if $puppet_vim_env::puppetlint_opts != '' {
    file_line { 'add puppet-lint options to vimrc':
      path => "${homedir}/.vimrc",
      line => "let g:syntastic_puppet_puppetlint_args=\'${puppet_vim_env::puppetlint_opts}\'",
    }
  }

}

