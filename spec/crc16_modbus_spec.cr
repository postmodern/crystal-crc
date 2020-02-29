require "./spec_helper"
require "../src/digest/crc16_modbus"

crc_specs_for Digest::CRC16Modbus, "1234567890", 0xc20a
