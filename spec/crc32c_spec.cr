require "./spec_helper"
require "../src/crc/crc32c"

crc_specs_for CRC::CRC32c, "1234567890", 0xf3dbd4fe
