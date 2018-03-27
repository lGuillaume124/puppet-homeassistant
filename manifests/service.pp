# @summary Manages the home-assistant service.
class homeassistant::service {

  service { 'homeassistant':
    ensure  => true,
    enable  => true,
    require => Systemd::Unit_file['homeassistant.service'],
  }

}
