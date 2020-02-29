require "./spec_helper"
require "../src/digest/crc32"

crc_specs_for Digest::CRC32, "1234567890", 0x261daee5
