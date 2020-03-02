require "./spec_helper"
require "../src/digest/crc32_bzip2"

crc_specs_for Digest::CRC32BZip2, "1234567890", 0x506853b6
