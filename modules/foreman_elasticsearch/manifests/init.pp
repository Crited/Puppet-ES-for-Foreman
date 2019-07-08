class foreman_elasticsearch 
(
$sourcepath  = "puppet:///modules/${module_name}", 
$esaddr      = '192.168.0.4', 
$esport      = '9200',
$rsyslogpath = '/etc/rsyslog.d',
)
{
  include ::foreman_elasticsearch::install
  include ::foreman_elasticsearch::vcsrepo
  include ::foreman_elasticsearch::template
  include ::foreman_elasticsearch::selinux
  include ::foreman_elasticsearch::rsyslog
  include ::foreman_elasticsearch::rails
  include ::foreman_elasticsearch::candlepin
  include ::foreman_elasticsearch::logrotate

  Class['::foreman_elasticsearch::install']   -> 
  Class['::foreman_elasticsearch::vcsrepo']   ->
  Class['::foreman_elasticsearch::template']  ->
  Class['::foreman_elasticsearch::selinux']   ->
  Class['::foreman_elasticsearch::rsyslog']   ->
  Class['::foreman_elasticsearch::rails']     ->
  Class['::foreman_elasticsearch::candlepin'] ->
  Class['::foreman_elasticsearch::logrotate']
}
