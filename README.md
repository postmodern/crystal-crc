# digest-crc.cr

* [Source](https://github.com/postmodern/digest-crc.cr)
* [Issues](https://github.com/postmodern/digest-crc.cr/issues)
* [Docs](https://postmodern.github.io/docs/digest-crc.cr/index.html)

CRC (Cyclic Redundancy Check) algorithms for [Crystal][crystal]. Based on the
[digest-crc] Ruby library.

## Features

* Provides support for the following CRC algorithms:
  * `Digest::CRC1`
  * `Digest::CRC5`
  * `Digest::CRC8`
  * `Digest::CRC81Wire`
  * `Digest::CRC16`
  * `Digest::CRC16CCITT`
  * `Digest::CRC16DNP`
  * `Digest::CRC16Modbus`
  * `Digest::CRC16USB`
  * `Digest::CRC16XModem`
  * `Digest::CRC16ZModem`
  * `Digest::CRC16QT`
  * `Digest::CRC24`
  * `Digest::CRC32`
  * `Digest::CRC32c`
  * `Digest::CRC32Mpeg`
  * `Digest::CRC64`
* Pure Crystal implementation.
* Uses Crystal's `Digest::Base` class.
* Provides CRC Tables for optimized calculations.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     digest-crc:
       github: postmodern/digest-crc.cr
   ```

2. Run `shards install`

## Examples

Calculate a CRC32:

```crystal
require "digest/crc32"

Digest::CRC32.hexdigest("hello")
# => "3610a686"
```

Calculate a CRC32 of a file:

```crystal
Digest::CRC32.file("README.md")
# => #<Digest::CRC32: 127ad531>
```

Incrementally calculate a CRC32:

```crystal
crc = Digest::CRC32.new
crc << "one"
crc << "two"
crc << "three"
crc.hexdigest
# => "09e1c092"
```

Directly access the checksum:

```crystal
crc.checksum
# => 165789842
```

Defining your own CRC class:

```crystal
require "digest/crc32"

module Digest
  class CRC3000 < CRC32

    class_getter init_crc = 0xffffffff_u32

    class_getter xor_mask = 0xffffffff_u32

    TABLE = [
      # ....
    ].freeze

    @table = TABLE

    def update(data)
      data.each_byte do |b|
        @crc = (((@crc >> 8) & 0x00ffffff) ^ @table[(@crc ^ b) & 0xff])
      end

      return self
    end
  end
end
```

## Development

CRC `TABLE` values for common CRC algorithms can be obtained from the [pycrc]
tool:

    ./pycrc.py --algorithm=table-driven --model=crc-32 --generate=c

## Contributing

1. Fork it (<https://github.com/postmodern/digest/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Postmodern](https://github.com/postmodern) - creator and maintainer

[crystal]: https://www.crystal-lang.org/
[digest-crc]: https://github.com/postmodern/digest-crc
[pycrc]: http://www.tty1.net/pycrc/
