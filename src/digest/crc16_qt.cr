require "./crc16_ccitt"

module Digest
  #
  # Implements the CRC16_CCITT algorithm used in QT algorithms.
  #
  # @author Matthew Bednarski
  #
  class CRC16QT < CRC16CCITT

    # final XOR mask.
    class_getter final_xor = 0xffff_u16

    # Controls whether to reverse the bits in the CRC result.
    class_getter? reverse_crc_result = true

    # Controls whether to reverse the input data.
    class_getter? reverse_data = true

    @final_xor : UInt16
    @reverse_crc_result : Bool
    @reverse_data       : Bool

    #
    # Initializes the CRC16QT instance.
    #
    def initialize(crc = self.class.init_crc)
      super(crc)

      @final_xor          = self.class.final_xor
      @reverse_crc_result = self.class.reverse_crc_result?
      @reverse_data       = self.class.reverse_data?
    end

    #
    # Updates the CRC16 checksum.
    #
    def update(data)
      data.each_byte do |b|
        b = revert_byte(b) if @reverse_data
        @crc = ((@table[((@crc >> 8) ^ b) & 0xff] ^ (@crc << 8)) & 0xffff)
      end

      return self
    end

    #
    # Calculates the final CRC16 QT checksum value.
    #
    def checksum
      crc = @crc + 0
      crc ^= @final_xor      if @final_xor
      crc = revert_bits(crc) if @reverse_crc_result
      return crc
    end

    private def revert_bits(cc)
      ob = 0_u16
      b  = (1_u16 << 15)

      16.times do |t|
        ob |= (1 << t) if (cc & b) != 0
        b >>= 1
      end

      return ob
    end

    private def revert_byte(cc)
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
