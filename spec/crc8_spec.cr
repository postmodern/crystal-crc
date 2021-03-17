require "./spec_helper"
require "../src/crc/crc8"

crc_specs_for CRC::CRC8, "1234567890", 0x52
