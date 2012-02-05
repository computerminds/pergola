class pergola_postfix {
  
  
  # Install postfix
  preseed_package { 'postfix':
    ensure => 'latest',
    module_name => 'pergola_postfix',
     
  }
  
}