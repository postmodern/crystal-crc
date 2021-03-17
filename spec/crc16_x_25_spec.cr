require "./spec_helper"
require "../src/crc/crc16_x_25"

crc_specs_for CRC::CRC16X25, "1234567890", 0x4b13
