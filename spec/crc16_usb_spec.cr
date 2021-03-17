require "./spec_helper"
require "../src/crc/crc16_usb"

crc_specs_for CRC::CRC16USB, "1234567890", 0x3df5
