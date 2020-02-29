require "./spec_helper"
require "../src/digest/crc16_zmodem"

crc_specs_for Digest::CRC16ZModem, "1234567890", 0xd321
