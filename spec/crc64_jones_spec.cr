require "./spec_helper"
require "../src/crc/crc64_jones"

crc_specs_for CRC::CRC64Jones, "1234567890", 0x68a745ba133af9bd
