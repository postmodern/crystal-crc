require "./crc"

module Digest
  #
  # Implements the CRC1 algorithm.
  #
  class CRC1 < CRC(UInt32) # TODO: optimize algo to use UInt8

    #
    # Updates the CRC1 checksum.
    #
    def update(data) : self
      accum = 0
      data.each_byte { |b| accum += b }

      @crc += (accum % 256)

      return self
    end

    #
    # The packed CRC value.
    #
    def result : StaticArray(UInt8,1)
      bytes = uninitialized UInt8[1]
      bytes[0] = (checksum & 0xff).to_u8
      return bytes
    end

  end
end
