# @summary A known device is a connected device considered "in home".
#
# @param mac The MAC address of the device.
# @param hide_if_away If true then the device will be hidden if it is not at home.
# @param friendly_name A friendly name for your device.
# @param track If true then the device will be tracked. Otherwise its location and state will not update.
# @param picture A picture that you can use to easily identify the person or device.
# @param gravatar An email address for the device’s owner. If provided, it will override picture.
define homeassistant::known_device(
  String  $mac,
  Boolean $hide_if_away = true,
  String $friendly_name = $title,
  Boolean $track = false,
  Optional[String] $picture = undef,
  Optional[String] $gravatar = undef,
) {

  concat::fragment { "${title}_knowndevice":
    target  => 'known_devices.yaml',
    order   => '05',
    content => template('homeassistant/known_device.yaml.erb'),
  }

}
