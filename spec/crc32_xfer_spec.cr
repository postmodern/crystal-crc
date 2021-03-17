require "./spec_helper"
require "../src/crc/crc32_xfer"

crc_specs_for CRC::CRC32XFER, "1234567890", 0x0be368eb, "0be368eb"
