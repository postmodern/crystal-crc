require "./crc16"

#
# Implements the CRC16 USB algorithm.
#
class Digest::CRC16USB < Digest::CRC16

  # Initial CRC value.
  class_getter init_crc : UInt16 = 0xffff_u16

  # CRC XOR mask.
  class_getter xor_mask : UInt16 = 0xffff_u16

end
