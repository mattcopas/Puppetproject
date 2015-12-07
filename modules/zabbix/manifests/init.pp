#------------------------------------------------------------------
# Author: Daniel Mabbett
#------------------------------------------------------------------

class zabbix {

  $masterip = '192.168.1.250'
  $zabip = $::ipaddress_eth1
  $zabhost = $::fqdn

  #----------------------------------------------------------------
  # Path  
  #----------------------------------------------------------------
 
  Exec {
    path => [
      '/usr/local/bin',
      '/opt/local/bin',
      '/usr/bin',
      '/bin',
      '/sbin'],
    logoutput => true,
  }

  #----------------------------------------------------------------
  # Exec's  
  #----------------------------------------------------------------
 
  if $operatingsystem == 'Ubuntu' {

    exec {'install_agent_prezabbix_update':
      user    => root,
      command => 'apt-get update',
      before  => Exec['install_agent_zabbix_software'],
    }

    exec {'install_agent_zabbix_software':
      user    => root,
      command => 'apt-get install -y zabbix-agent',
      before  => Exec['edit_zabbix_server'],
    }

    exec {'edit_zabbix_server':
      user    => root,
      command => "sed -i 's/Server=127.0.0.1/Server=${masterip}/' /etc/zabbix/zabbix_agentd.conf",
      before  => Exec['edit_zabbix_hostname'],
    }
  
    exec {'edit_zabbix_hostname':
      user    => root,
      command => "sed -i 's/Hostname=Zabbix server/Hostname=${zabhost}' /etc/zabbix/zabbix_agentd.conf",
      before  => Exec['update_zabbix_config_files'],
    }
  
    exec {'update_zabbix_config_files':
      user    => root,
      command => "service zabbix-agent restart",
    }  

  }else {
    warning( 'Operating system is not supported.' )
  }
}