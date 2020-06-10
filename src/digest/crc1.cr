require "./crc"

module Digest
  #
  # Implements the CRC1 algorithm.
  #
  class CRC1 < CRC(UInt32) # TODO: optimize algo to use UInt8

    def digest_size
      1
    end

    #
    # Updates the CRC1 checksum.
    #
    def update_impl(data : Bytes) : Nil
      accum = 0
      data.each { |b| accum += b }

      @crc += (accum % 256)

      return self
    end

    #
    # The packed CRC value.
    #
    def final_impl(dst : Bytes) : Nil
      dst[0] = (checksum & 0xff).to_u8
    end

  end
end
