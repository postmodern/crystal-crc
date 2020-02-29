require "digest/base"

module Digest
  abstract class CRC(UINT) < ::Digest::Base

    def self.init_crc : UINT
      UINT.new(0)
    end

    def self.xor_mask : UINT
      UINT.new(0)
    end

    def initialize(@crc : UINT = self.class.init_crc)
    end

    #
    # Calculates the CRC checksum.
    #
    def self.checksum(data)
      crc = self.new
      crc << data

      crc.checksum
    end

    #
    # Updates the CRC checksum with the given data.
    #
    abstract def update(data)

    #
    # @see #update
    #
    @[AlwaysInline]
    def <<(data)
      update(data)
      self
    end

    #
    # Resets the CRC checksum.
    #
    def reset
      @crc = self.class.init_crc
    end

    #
    # The resulting CRC checksum.
    #
    def checksum : UINT
      @crc ^ self.class.xor_mask
    end

    #
    # Finalizes the CRC checksum calculation.
    #
    def final
    end

    #
    # The packed CRC result.
    #
    abstract def result

  end
end
