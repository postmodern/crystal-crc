require "spectator"

macro crc_specs_for(klass, string, expected_checksum, expected_hexdigest)
  Spectator.describe {{ klass }} do
    let(string) { {{ string }} }
    let(expected_hexdigest) { {{ expected_hexdigest }} }
    let(expected_checksum) { {{ expected_checksum }} }

    it "should calculate a checksum for text" do
      expect(described_class.hexdigest(string)).to be == expected_hexdigest
    end

    it "should calculate a checksum for multiple data" do
      middle = (string.size / 2).to_i

      chunk1 = string[0,middle]
      chunk2 = string[middle..-1]

      hexdigest = described_class.hexdigest do |crc|
        crc.update(chunk1)
        crc.update(chunk2)
      end

      expect(hexdigest).to be == expected_hexdigest
    end

    it "should provide direct access to the checksum value" do
      crc = subject
      crc.update(string)

      expect(crc.checksum).to be == expected_checksum
    end
  end
end

macro crc_specs_for(klass, string, expected_checksum)
  crc_specs_for( {{ klass }}, {{ string }}, {{ expected_checksum }}, {{ expected_checksum }}.to_s(16))
end
