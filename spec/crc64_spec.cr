require "./spec_helper"
require "../src/crc/crc64"

crc_specs_for CRC::CRC64, "1234567890", 0xbc66a5a9388a5bef
