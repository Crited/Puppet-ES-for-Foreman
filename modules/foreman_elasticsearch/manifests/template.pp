class foreman_elasticsearch::template {

  exec { 'Upload foreman-template':
    command => "curl -X PUT ${foreman_elasticsearch::esaddr}:${foreman_elasticsearch::esport}/_template/project.foreman -H 'Content-Type: appliaction/json' -d@/etc/foreman/foreman-elasticsearch/org.foreman.viaq-cdm.5.5.2.template.json && touch /etc/foreman/foreman-elasticsearch/template.check",
    path    => ['/usr/bin/', '/usr/sbin/', '/bin/'],
    creates => '/etc/foreman/foreman-elasticsearch/template.check',
  }

}
