require "./spec_helper"
require "../src/digest/crc32c"

crc_specs_for Digest::CRC32c, "1234567890", 0xf3dbd4fe
