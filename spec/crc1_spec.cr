require "./spec_helper"
require "../src/crc/crc1"

crc_specs_for CRC::CRC1, "1234567890", 0x0d, "0d"
