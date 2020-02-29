require "./spec_helper"
require "../src/digest/crc16_xmodem"

crc_specs_for Digest::CRC16XModem, "1234567890", 0xd321
