class foreman_elasticsearch 
(
$sourcepath  = "puppet:///modules/${module_name}", 
$esaddr      = '192.168.0.4', 
$esport      = '9200',
$rsyslogpath = '/etc/rsyslog.d',
)
{
  class{'foreman_elasticsearch::install': }   -> 
  class{'foreman_elasticsearch::vcsrepo': }   ->
  class{'foreman_elasticsearch::template': }  ->
  class{'foreman_elasticsearch::selinux': }   ->
  class{'foreman_elasticsearch::rsyslog': }   ->
  class{'foreman_elasticsearch::rails': }     ->
  class{'foreman_elasticsearch::candlepin': } ->
  class{'foreman_elasticsearch::logrotate': }
}
