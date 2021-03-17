require "./spec_helper"
require "../src/crc/crc16"

crc_specs_for CRC::CRC16, "1234567890", 0xc57a
