require "./spec_helper"
require "../src/crc/crc16_ccitt"

crc_specs_for CRC::CRC16CCITT, "1234567890", 0x3218
