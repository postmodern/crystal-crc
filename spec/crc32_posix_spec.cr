require "./spec_helper"
require "../src/crc/crc32_posix"

crc_specs_for CRC::CRC32POSIX, "1234567890", 0xc181fd8e
