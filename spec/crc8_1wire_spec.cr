require "./spec_helper"
require "../src/digest/crc8_1wire"

crc_specs_for Digest::CRC81Wire, "1234567890", 0x4f
