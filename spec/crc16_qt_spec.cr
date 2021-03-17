require "./spec_helper"
require "../src/crc/crc16_qt"

crc_specs_for CRC::CRC16QT, "1234567890", 0x4b13
