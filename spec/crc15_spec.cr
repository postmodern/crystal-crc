require "./spec_helper"
require "../src/digest/crc15"

crc_specs_for Digest::CRC15, "1234567890", 0x178c
