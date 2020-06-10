require "./crc16_ccitt"

module Digest
  #
  # Implements the CRC16_CCITT algorithm used in QT algorithms.
  #
  # @author Matthew Bednarski
  #
  class CRC16QT < CRC16CCITT

    # final XOR mask.
    class_getter final_xor : UInt16 = 0xffff_u16

    @final_xor : UInt16

    #
    # Initializes the CRC16QT instance.
    #
    def initialize(crc = self.class.init_crc)
      super(crc)

      @final_xor = self.class.final_xor
    end

    #
    # Updates the CRC16 checksum.
    #
    def update_impl(data : Bytes) : Nil
      data.each do |b|
        b = revert_byte(b)
        @crc = ((@table[((@crc >> 8) ^ b) & 0xff] ^ (@crc << 8)) & 0xffff)
      end
    end

    #
    # Calculates the final CRC16 QT checksum value.
    #
    def checksum : UInt16
      crc = super
      crc ^= @final_xor
      crc = revert_bits(crc)
      return crc
    end

    private def revert_bits(cc : UInt16) : UInt16
      ob = 0_u16
      b  = (1_u16 << 15)

      16.times do |t|
        ob |= (1 << t) if (cc & b) != 0
        b >>= 1
      end

      return ob
    end

    private def revert_byte(cc : UInt8) : UInt16
      ob = 0_u16
      b  = (1_u16 << 7)

      8.times do |t|
        ob |= (1 << t) if (cc & b) != 0
        b >>= 1
      end

      return ob
    end

  end
end
