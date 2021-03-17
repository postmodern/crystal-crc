require "./spec_helper"
require "../src/crc/crc64_xz"

crc_specs_for CRC::CRC64XZ, "1234567890", 0xb1cb31bbb4a2b2be
