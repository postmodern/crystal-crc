require "./spec_helper"
require "../src/crc/crc16_kermit"

crc_specs_for CRC::CRC16Kermit, "1234567890", 0x286b
