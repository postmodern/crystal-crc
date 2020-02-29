require "./spec_helper"
require "../src/digest/crc"

Spectator.describe Digest::CRC do
  context "when inherited" do
    class SubClass < Digest::CRC(UInt16)
      TABLE = [0x01, 0x02, 0x03, 0x04]

      @table = TABLE

      class_getter init_crc = 0x01_u16

      class_getter xor_mask = 0x02_u16

      getter crc

      def update(data)
        @crc = (@crc << 1) | 0x1
      end

      def result
        buffer = uninitialized UInt8[1]
        buffer[0] = 0x42_u8
        buffer
      end
    end

    subject { SubClass.new }

    describe "#initialize" do
      it "should initialize @crc" do
        expect(subject.crc).to eq(SubClass.init_crc)
      end
    end

    describe "#checksum" do
      subject { SubClass.new(0x1) }

      it "must XOR the @crc with the xor_mask" do
        expect(subject.checksum).to be == (subject.crc ^ SubClass.xor_mask)
      end
    end

    describe "#reset" do
      it "must reset the @crc to the init_crc value" do
        subject.update("foo")
        subject.update("bar")
        subject.reset

        expect(subject.crc).to eq(SubClass.init_crc)
      end
    end
  end
end
