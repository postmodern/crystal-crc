require "./spec_helper"
require "../src/crc/crc16_modbus"

crc_specs_for CRC::CRC16Modbus, "1234567890", 0xc20a
