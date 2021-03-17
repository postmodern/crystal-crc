require "./spec_helper"
require "../src/crc/crc32"

crc_specs_for CRC::CRC32, "1234567890", 0x261daee5
