class foreman_elasticsearch::rsyslog {

  $erbaddr        = $foreman_elasticsearch::esaddr
  $erbport        = $foreman_elasticsearch::esport
  $erbrsyslogpath = $foreman_elasticsearch::rsyslogpath


  file { "$foreman_elasticsearch::rsyslogpath":
    ensure => 'directory',
  } ->

  file { "${foreman_elasticsearch::rsyslogpath}/normalize_level.json":
    ensure => 'file',
    source => "${foreman_elasticsearch::sourcepath}/normalize_level.json",
  } ->

  file { "${foreman_elasticsearch::rsyslogpath}/prio_to_level.json":
    ensure => 'file',
    source => "${foreman_elasticsearch::sourcepath}/prio_to_level.json",
  } ->

  file { "${foreman_elasticsearch::rsyslogpath}/foreman.conf":
    content => template('foreman_elasticsearch/foreman.conf.erb'),
  }

  service { "rsyslog" :
    ensure    => "running",
    enable    => "true",
    subscribe => [
      File["${foreman_elasticsearch::rsyslogpath}/normalize_level.json"],
      File["${foreman_elasticsearch::rsyslogpath}/prio_to_level.json"],
      File["${foreman_elasticsearch::rsyslogpath}/foreman.conf"]
    ],
  }

}