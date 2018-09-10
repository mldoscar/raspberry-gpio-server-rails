# Do require if it's on a Raspberry PI
require 'rpi_gpio' if RbConfig::CONFIG['host_os'] == 'linux-gnueabihf'

module AppSettings
  GPIO = RPi::GPIO rescue nil
end