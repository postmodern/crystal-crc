require "digest/digest"

abstract class Digest::CRC(UINT) < ::Digest

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
  # @see #update
  #
  @[AlwaysInline]
  def <<(data)
    update(data)
    self
  end

  #
  # The resulting CRC checksum.
  #
  def checksum : UINT
    @crc ^ self.class.xor_mask
  end

  #
  # Updates the CRC checksum with the given data.
  #
  abstract def update_impl(data : Bytes) : Nil

  #
  # Packs the final CRC result.
  #
  abstract def final_impl(dst : Bytes) : Nil

  #
  # Resets the CRC checksum.
  #
  def reset_impl : Nil
    @crc = self.class.init_crc
  end

  #
  # The size of the resulting CRC checksum.
  #
  def digest_size : Int32
    sizeof(UINT)
  end

end
