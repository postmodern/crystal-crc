require "./spec_helper"
require "../src/digest/crc32_jam"

crc_specs_for Digest::CRC32Jam, "1234567890", 0xd9e2511a
