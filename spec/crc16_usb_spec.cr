require "./spec_helper"
require "../src/digest/crc16_usb"

crc_specs_for Digest::CRC16USB, "1234567890", 0x3df5
