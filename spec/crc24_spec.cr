require "./spec_helper"
require "../src/crc/crc24"

crc_specs_for CRC::CRC24, "1234567890", 0x8c0072
