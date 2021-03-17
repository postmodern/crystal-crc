require "./spec_helper"
require "../src/crc/crc16_xmodem"

crc_specs_for CRC::CRC16XModem, "1234567890", 0xd321
