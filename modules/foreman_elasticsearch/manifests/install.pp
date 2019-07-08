class foreman_elasticsearch::install {

  $packages = [ 'rsyslog-elasticsearch', 'rsyslog-mmnormalize', 'rsyslog-mmjsonparse', 'foreman-journald', 'foreman-proxy-journald' ]

  package { $packages: ensure => installed, }

}
