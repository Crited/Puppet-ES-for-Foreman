class foreman_elasticsearch::rails {

  exec { 'foreman-installer':
    command => 'foreman-installer --foreman-logging-level info --foreman-logging-type journald --foreman-logging-layout pattern --foreman-proxy-log JOURNAL && touch /etc/foreman/foreman-elasticsearch/installer.check',
    path    => ['/usr/bin/', '/usr/sbin/', '/bin/'],
    creates => '/etc/foreman/foreman-elasticsearch/installer.check',
    notify => [
      Service["foreman-proxy"],
      Service["httpd"],
    ],
  }

  service { "foreman-proxy" :
    ensure    => "running",
    enable    => "true",
  }

  service { "httpd" :
    ensure    => "running",
    enable    => "true",
  }
}