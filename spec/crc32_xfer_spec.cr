require "./spec_helper"
require "../src/digest/crc32_xfer"

crc_specs_for Digest::CRC32XFER, "1234567890", 0x0be368eb, "0be368eb"
