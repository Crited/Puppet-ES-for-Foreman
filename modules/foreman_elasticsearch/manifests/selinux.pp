class foreman_elasticsearch::selinux {

  if "${::selinux}"=="false"{
    notify { "Warning":
      message => "Selinux is currently not getting enforced, we recommend doing so for security purposes."
    }
  }

  selinux::permissive { 'syslogd_t':
    ensure => 'present'
  }

}
