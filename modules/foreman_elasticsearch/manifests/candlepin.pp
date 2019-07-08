class foreman_elasticsearch::candlepin {

  file { "/var/lib/tomcat/webapps/candlepin/WEB-INF/classes/logback.xml":
    ensure => 'file',
    source => "${foreman_elasticsearch::sourcepath}/candlepin.xml",
    notify => Service["tomcat"],
  }

  service { "tomcat" :
    ensure    => "running",
    enable    => "true",
  }

}