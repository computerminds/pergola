import 'classes/*'

class solr (
  $backend = 'tomcat'
) {
  include solr::packages
  include solr::files
  include solr::config
  include solr::services

  Class['solr::packages'] -> Class ['solr::files'] -> Class['solr::config'] -> Class['solr::services']
}
