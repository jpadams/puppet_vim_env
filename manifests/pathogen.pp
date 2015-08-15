# pathogen.pp
class puppet_vim_env::pathogen (
  $homedir,
  $owner,
  $colorscheme,
  $puppetlint_opts
) {

  $autoloaddir = "${homedir}/.vim/autoload"

  file { $autoloaddir:
    ensure  => directory,
    owner   => $owner,
    require => File[ "${homedir}/.vim" ],
  }

  file { "${autoloaddir}/pathogen.vim":
    ensure => file,
    owner  => $owner,
    source => 'puppet:///modules/puppet_vim_env/pathogen.vim',
  }

  file { "${homedir}/.vimrc":
    ensure  => file,
    owner   => $owner,
    content => epp('puppet_vim_env/vimrc.epp'),
  }

}
