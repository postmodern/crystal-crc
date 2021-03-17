require "./spec_helper"
require "../src/crc/crc32_mpeg"

crc_specs_for CRC::CRC32MPEG, "1234567890", 0xaf97ac49
