require "./spec_helper"
require "../src/crc/crc15"

crc_specs_for CRC::CRC15, "1234567890", 0x178c
