# == Class: nsswitch
#
# This module manages nsswitch.
#
class nsswitch (
  Stdlib::Absolutepath $config_file,
  Enum['absent','present'] $ensure_ldap,
  Enum['absent','present'] $ensure_vas,
  String $vas_nss_module_passwd,
  String $vas_nss_module_group,
  String $vas_nss_module_automount,
  String $vas_nss_module_netgroup,
  String $vas_nss_module_aliases,
  String $vas_nss_module_services,
  String $passwd,
  String $sudoers,
  String $shadow,
  String $group,
  String $hosts,
  String $automount,
  String $services,
  String $bootparams,
  String $aliases,
  String $publickey,
  String $netgroup,
  String $protocols,
  String $ethers,
  String $rpc,
  String $nsswitch_ipnodes,
  String $nsswitch_printers,
  String $nsswitch_auth_attr,
  String $nsswitch_prof_attr,
  String $nsswitch_project,
) {
  if $passwd == 'USE_DEFAULTS' {
    $passwd_real = $nsswitch::default_passwd
  } else {
    $passwd_real = $passwd
  }

  if $nsswitch::protocols == 'USE_DEFAULTS' {
    $protocols_real = $nsswitch::default_protocols
  } else {
    $protocols_real = $nsswitch::protocols
  }

  if $nsswitch::ethers == 'USE_DEFAULTS' {
    $ethers_real = $nsswitch::default_ethers
  } else {
    $ethers_real = $nsswitch::ethers
  }

  if $nsswitch::rpc == 'USE_DEFAULTS' {
    $rpc_real = $nsswitch::default_rpc
  } else {
    $rpc_real = $nsswitch::rpc
  }

  if $nsswitch::shadow == 'USE_DEFAULTS' {
    $shadow_real = $nsswitch::default_shadow
  } else {
    $shadow_real = $nsswitch::shadow
  }

  if $nsswitch::sudoers == 'USE_DEFAULTS' {
    $sudoers_real = $nsswitch::default_sudoers
  } else {
    $sudoers_real = $nsswitch::sudoers
  }

  if $nsswitch::group == 'USE_DEFAULTS' {
    $group_real = $nsswitch::default_group
  } else {
    $group_real = $nsswitch::group
  }

  if $nsswitch::hosts == 'USE_DEFAULTS' {
    $hosts_real = $nsswitch::default_hosts
  } else {
    $hosts_real = $nsswitch::hosts
  }

  if $nsswitch::automount == 'USE_DEFAULTS' {
    $automount_real = $nsswitch::default_automount
  } else {
    $automount_real = $nsswitch::automount
  }

  if $nsswitch::services == 'USE_DEFAULTS' {
    $services_real = $nsswitch::default_services
  } else {
    $services_real = $nsswitch::services
  }

  if $nsswitch::bootparams == 'USE_DEFAULTS' {
    $bootparams_real = $nsswitch::default_bootparams
  } else {
    $bootparams_real = $nsswitch::bootparams
  }

  if $nsswitch::aliases == 'USE_DEFAULTS' {
    $aliases_real = $nsswitch::default_aliases
  } else {
    $aliases_real = $nsswitch::aliases
  }

  if $nsswitch::publickey == 'USE_DEFAULTS' {
    $publickey_real = $nsswitch::default_publickey
  } else {
    $publickey_real = $nsswitch::publickey
  }

  if $nsswitch::netgroup == 'USE_DEFAULTS' {
    $netgroup_real = $nsswitch::default_netgroup
  } else {
    $netgroup_real = $nsswitch::netgroup
  }

  if $nsswitch::nsswitch_ipnodes == 'USE_DEFAULTS' {
    $nsswitch_ipnodes_real = $nsswitch::default_nsswitch_ipnodes
  } else {
    $nsswitch_ipnodes_real = $nsswitch::nsswitch_ipnodes
  }

  if $nsswitch::nsswitch_printers == 'USE_DEFAULTS' {
    $nsswitch_printers_real = $nsswitch::default_nsswitch_printers
  } else {
    $nsswitch_printers_real = $nsswitch::nsswitch_printers
  }

  if $nsswitch::nsswitch_auth_attr == 'USE_DEFAULTS' {
    $nsswitch_auth_attr_real = $nsswitch::default_nsswitch_auth_attr
  } else {
    $nsswitch_auth_attr_real = $nsswitch::nsswitch_auth_attr
  }

  if $nsswitch::nsswitch_prof_attr == 'USE_DEFAULTS' {
    $nsswitch_prof_attr_real = $nsswitch::default_nsswitch_prof_attr
  } else {
    $nsswitch_prof_attr_real = $nsswitch::nsswitch_prof_attr
  }

  if $nsswitch::nsswitch_project == 'USE_DEFAULTS' {
    $nsswitch_project_real = $nsswitch::default_nsswitch_project
  } else {
    $nsswitch_project_real = $nsswitch::nsswitch_project
  }

  file { 'nsswitch_config_file':
    ensure  => file,
    path    => $config_file,
    content => template('nsswitch/nsswitch.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
