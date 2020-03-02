require "./spec_helper"
require "../src/digest/crc64_xz"

crc_specs_for Digest::CRC64XZ, "1234567890", 0xb1cb31bbb4a2b2be
