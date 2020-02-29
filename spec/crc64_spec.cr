require "./spec_helper"
require "../src/digest/crc64"

crc_specs_for Digest::CRC64, "1234567890", 0xbc66a5a9388a5bef
