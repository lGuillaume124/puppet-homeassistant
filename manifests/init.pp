# @summary Puppet Module for Home Assistant - home automation platform.
#
# @example Declaring the class
#   include ::homeassistant
#
# @param location_name Name of the location where Home Assistant is running.
# @param latitude Latitude of your location required to calculate the time the sun rises and sets.
# @param longitude Longitude of your location required to calculate the time the sun rises and sets.
# @param elevation Altitude abose sea level in meters. Impacts weather/sunrise data.
# @param unit_system metric for Metric, imperial for Imperial.
# @param time_zone Your time zone.
# @param known_devices A list of connected devices considered "in home".
# @param home Installation directory.
# @param confdir Configuration directory.
# @param known_devices_replace Define if Puppet should let hass manage known_devices.yaml or not.
# @param manage_python Define if the python Puppet class should be declared or not.
#
class homeassistant (
  String $location_name,
  Numeric $latitude,
  Numeric $longitude,
  Numeric $elevation,
  Enum['imperial', 'metric'] $unit_system,
  String $time_zone,
  Hash $known_devices = {},
  Stdlib::Absolutepath $home   = '/srv/homeassistant',
  Stdlib::Absolutepath $confdir = '/etc/homeassistant',
  Boolean $known_devices_replace = false,
  Boolean $manage_python = true,
) {

  class { '::homeassistant::install': }
  -> class { '::homeassistant::config': }
  ~> class { '::homeassistant::service': }

  contain ::homeassistant::install
  contain ::homeassistant::config
  contain ::homeassistant::service

}
