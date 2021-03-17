require "./spec_helper"
require "../src/crc/crc32_jam"

crc_specs_for CRC::CRC32Jam, "1234567890", 0xd9e2511a
