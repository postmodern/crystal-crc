require "digest/base"

module Digest
  abstract class CRC(UINT) < ::Digest::Base

    #
    # The default initial CRC value.
    #
    def self.init_crc : UINT
      UINT.new(0)
    end

    #
    # The default CRC XOR mask.
    #
    def self.xor_mask : UINT
      UINT.new(0)
    end

    #
    # Initializes the CRC instance.
    #
    def initialize(@crc : UINT = self.class.init_crc)
    end

    #
    # Calculates the CRC checksum.
    #
    def self.checksum(data) : UINT
      crc = self.new
      crc << data

      crc.final
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
