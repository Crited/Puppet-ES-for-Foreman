class foreman_elasticsearch::logrotate {

  $logrotatedummies=["/etc/logrotate.d/foreman", "/etc/logrotate.d/foreman-proxy", "/etc/logrotate.d/candlepin"]

  file { $logrotatedummies:
    ensure => 'file',
    content => '#',
  }

  file { "/etc/logrotate.d/foreman-elasticsearch":
    content => template('foreman_elasticsearch/logrotate-foreman-elasticsearch.erb'),
  }

}