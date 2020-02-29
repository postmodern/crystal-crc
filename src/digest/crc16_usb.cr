require "./crc16"

module Digest
  #
  # Implements the CRC16 USB algorithm.
  #
  class CRC16USB < CRC16

    class_getter init_crc = 0xffff_u16

    class_getter xor_mask = 0xffff_u16

  end
end
