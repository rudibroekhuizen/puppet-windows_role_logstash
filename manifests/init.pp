# == Class: windows_role_logstash
#
# Full description of class windows_role_logstash here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'windows_role_logstash':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class windows_role_logstash (
  $configfile_hash = undef,
  ) {

   # JSON magic
  package { jq:
    ensure   => 1.5,
    provider => chocolatey,
  }
  
  file { 'C:/ProgramData/logstash-1.4.2/files':
    ensure => 'directory',
  }

  # Copy scripts and other files
  file { 'C:/ProgramData/logstash-1.4.2/files':
    source             => 'puppet:///modules/windows_role_logtash',
    recurse            => true,
    source_permissions => ignore,
    require            => File[ 'C:/ProgramData/logstash-1.4.2/files' ]
  } ->
  
  class { 'windows_logstash':
    configfile_hash => $configfile_hash,
  }

}
