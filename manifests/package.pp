# == Class: redash::package
#

class redash::package {

    package { 'redis-server':
        ensure => installed
    }

    package { 'postgresql-server-dev-9.1':
        ensure => installed
    }


    $pip = '/opt/redash/bin/pip'

    class { 'python':
        version    => 'system',
        dev        => true,
        virtualenv => true,
        gunicorn   => false,
    }->
    python::virtualenv { '/opt/redash':
        ensure       => present,
        version      => 'system',
        owner        => 'deploy',
        group        => 'deploy',
    }->
    exec { 'git clone redash':
        command => '/usr/bin/git clone https://github.com/EverythingMe/redash.git /opt/redash/redash/current',
        user    => 'deploy',
        unless  => '/usr/bin/file /opt/redash/redash',
    }->
    python::pip { 'atfork==0.1.2':
        virtualenv    => '/opt/redash',
        owner         => 'deploy',
        install_args  => ['--allow-all-external --allow-unverified atfork'],
    }->
    exec { 'pip install redash requirement':
        command => "bash -c 'source /opt/redash/bin/activate && ${pip} install -r /opt/redash/redash/current/requirements.txt && touch /tmp/pip_done'",
        path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
        unless  => 'file /tmp/pip_done'
    }








}
