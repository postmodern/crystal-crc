require "./spec_helper"
require "../src/digest/crc16_qt"

crc_specs_for Digest::CRC16QT, "1234567890", 0x4b13
