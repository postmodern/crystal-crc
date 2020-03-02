require "./spec_helper"
require "../src/digest/crc16_kermit"

crc_specs_for Digest::CRC16Kermit, "1234567890", 0x286b
