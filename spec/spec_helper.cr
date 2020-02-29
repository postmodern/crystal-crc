require "spectator"

macro crc_specs_for(klass, string, expected)
  Spectator.describe {{ klass }} do
    let(string) { {{ string }} }
    let(expected) { {{ expected }} }
    let(expected_hexdigest) { "%02x" % {{ expected }} }

    it "should calculate a checksum for text" do
      expect(described_class.hexdigest(string)).to be == expected_hexdigest
    end

    it "should calculate a checksum for multiple data" do
      middle = (string.size / 2).to_i

      chunk1 = string[0,middle]
      chunk2 = string[middle..-1]

      hexdigest = described_class.hexdigest do |crc|
        crc << chunk1
        crc << chunk2
      end

      expect(hexdigest).to be == expected_hexdigest
    end

    it "should provide direct access to the checksum value" do
      crc = subject
      crc << string

      expect(crc.checksum).to be == expected
    end
  end
end

Spectator.configure do |config|
  config.formatter = Spectator::Formatting::DocumentFormatter.new
end
