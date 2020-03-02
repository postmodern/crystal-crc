require "./spec_helper"
require "../src/digest/crc16_genibus"

crc_specs_for Digest::CRC16Genibus, "1234567890", 0xcde7
