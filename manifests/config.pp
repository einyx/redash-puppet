# == Class: redash::config
#
# Install (and configure?) Redash.
#

class redash::config(
  $redash_db_host = $redash::redash_db_host ) {

    file { '/opt':
    ensure => directory,
    owner  => root,
    group  => deploy,
    mode   => '0774'
    }

    file { '/opt/redash/.env':
        ensure  => present,
        content => template('redash/env.erb'),
        owner   => deploy,
        group   => deploy,
        mode    => '0644'
    }
}
