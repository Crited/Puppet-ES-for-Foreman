class foreman_elasticsearch::vcsrepo {

class { 'git':}

  git::repo {'lzap/foreman-elasticsearch':
    target  => '/etc/foreman/foreman-elasticsearch',
    source  => 'https://github.com/lzap/foreman-elasticsearch.git',
    user    => 'root',
    require => Class['git'],
  }

}

