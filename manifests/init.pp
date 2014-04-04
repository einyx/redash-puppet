# == Class: redash
#
# Install (and configure?) Redash.
#
class redash ( $redash_db_host = 'localhost', $redash_db_password = undef, $redash_redshift_password = undef, $redash_redshift_host = undef ) {

  class { '::redash::package': } ->
  class { '::redash::config': } ->
  class { '::redash::service': } ->
  Class['redash']

}
