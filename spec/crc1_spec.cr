require "./spec_helper"
require "../src/digest/crc1"

crc_specs_for Digest::CRC1, "1234567890", 0x0d
