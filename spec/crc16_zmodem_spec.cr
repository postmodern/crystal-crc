require "./spec_helper"
require "../src/crc/crc16_zmodem"

crc_specs_for CRC::CRC16ZModem, "1234567890", 0xd321
