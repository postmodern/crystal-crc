require "./spec_helper"
require "../src/crc/crc16_genibus"

crc_specs_for CRC::CRC16Genibus, "1234567890", 0xcde7
