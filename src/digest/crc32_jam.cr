require "./crc32"

#
# Implements the CRC32 Jam algorithm.
#
class Digest::CRC32Jam < Digest::CRC32

  class_getter init_xor : UInt32 = 0xffffffff_u32

  class_getter init_crc : UInt32 = 0x00000000_u32 ^ init_xor

  class_getter xor_mask : UInt32 = 0x00000000_u32

end
