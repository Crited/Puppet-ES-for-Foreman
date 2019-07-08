class foreman_elasticsearch::selinux {

  if "${::selinux}"=="false"{
    notify { "Warning":
      message => "Selinux is currently not getting enforced, we recommend doing so for security purposes."
    }
  }

# exec { 'Set permissive for syslogd_t':
#   command => 'semanage permissive -a syslogd_t && touch /etc/foreman/foreman-elasticsearch/selinux.check',
#   path    => ['/usr/bin/', '/usr/sbin/', '/bin/'],
#   creates => '/etc/foreman/foreman-elasticsearch/selinux.check',
# }
  
  selinux::permissive { 'syslogd_t':
    ensure => 'present'
  }

}