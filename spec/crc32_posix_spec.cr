require "./spec_helper"
require "../src/digest/crc32_posix"

crc_specs_for Digest::CRC32POSIX, "1234567890", 0xc181fd8e
