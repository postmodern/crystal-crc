require "./spec_helper"
require "../src/crc/crc8_1wire"

crc_specs_for CRC::CRC8_1Wire, "1234567890", 0x4f
