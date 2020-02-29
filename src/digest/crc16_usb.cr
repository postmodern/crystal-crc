require "./crc16"

module Digest
  #
  # Implements the CRC16 USB algorithm.
  #
  class CRC16USB < CRC16

    # Initial CRC value.
    class_getter init_crc : UInt16 = 0xffff_u16

    # CRC XOR mask.
    class_getter xor_mask : UInt16 = 0xffff_u16

  end
end
