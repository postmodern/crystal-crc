require "./spec_helper"
require "../src/digest/crc64_jones"

crc_specs_for Digest::CRC64Jones, "1234567890", 0x68a745ba133af9bd
