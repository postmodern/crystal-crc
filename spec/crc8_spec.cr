require "./spec_helper"
require "../src/digest/crc8"

crc_specs_for Digest::CRC8, "1234567890", 0x52
