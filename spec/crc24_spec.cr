require "./spec_helper"
require "../src/digest/crc24"

crc_specs_for Digest::CRC24, "1234567890", 0x8c0072
