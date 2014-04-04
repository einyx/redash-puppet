# == Class: redash::service
#
class redash::service {

    file { '/etc/init/redash_web.conf':
        ensure => present,
        source => 'puppet:///modules/redash/etc/init/redash_web.conf',
        owner  => root,
        group  => root,
        mode   => '0644'
    }

    file { '/etc/init/redash_updater.conf':
        ensure => present,
        source => 'puppet:///modules/redash/etc/init/redash_updater.conf',
        owner  => root,
        group  => root,
        mode   => '0644'
    }

    service { 'redash_updater':
        ensure  => running,
        enable  => true,
        require => File['/etc/init/redash_updater.conf']
    }

    service { 'redash_web':
        ensure  => running,
        enable  => true,
        require => File['/etc/init/redash_web.conf']
    }

}
