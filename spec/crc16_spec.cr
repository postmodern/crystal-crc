require "./spec_helper"
require "../src/digest/crc16"

crc_specs_for Digest::CRC16, "1234567890", 0xc57a
