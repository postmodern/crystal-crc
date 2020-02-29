require "./spec_helper"
require "../src/digest/crc16_ccitt"

crc_specs_for Digest::CRC16CCITT, "1234567890", 0x3218
