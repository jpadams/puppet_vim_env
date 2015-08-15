# lint.pp
class puppet_vim_env::lint {

  package { 'puppet-lint':
    ensure   => installed,
    provider => 'puppet_gem'
  }

  file { '/usr/local/bin/puppet-lint':
    ensure => link,
    target => '/opt/puppetlabs/puppet/bin/puppet-lint',
  }

}
