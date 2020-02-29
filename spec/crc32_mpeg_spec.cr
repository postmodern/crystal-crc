require "./spec_helper"
require "../src/digest/crc32_mpeg"

crc_specs_for Digest::CRC32Mpeg, "1234567890", 0xaf97ac49
