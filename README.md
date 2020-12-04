# digest-crc.cr

* [Source](https://github.com/postmodern/digest-crc.cr)
* [Issues](https://github.com/postmodern/digest-crc.cr/issues)
* [Docs](https://postmodern.github.io/docs/digest-crc.cr/index.html)

CRC (Cyclic Redundancy Check) algorithms for [Crystal][crystal]. Based on the
[digest-crc] Ruby library and should be API compatible.

## Features

* Provides support for the following CRC algorithms:
  * `Digest::CRC1`
  * `Digest::CRC5`
  * `Digest::CRC8`
  * `Digest::CRC8_1Wire`
  * `Digest::CRC15`
  * `Digest::CRC16`
  * `Digest::CRC16CCITT`
  * `Digest::CRC16DNP`
  * `Digest::CRC16Genibus`
  * `Digest::CRC16Kermit`
  * `Digest::CRC16Modbus`
  * `Digest::CRC16USB`
  * `Digest::CRC16X25`
  * `Digest::CRC16XModem`
  * `Digest::CRC16ZModem`
  * `Digest::CRC16QT`
  * `Digest::CRC24`
  * `Digest::CRC32`
  * `Digest::CRC32c`
  * `Digest::CRC32BZip2`
  * `Digest::CRC32Jam`
  * `Digest::CRC32MPEG`
  * `Digest::CRC32POSIX`
  * `Digest::CRC32XFER`
  * `Digest::CRC64`
  * `Digest::CRC64Jones`
  * `Digest::CRC64XZ`
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

    def update_impl(data : Bytes) : Nil
      data.each do |b|
        @crc = (((@crc >> 8) & 0x00ffffff) ^ @table[(@crc ^ b) & 0xff])
      end
    end
  end
end
```

## Benchmarks

    $ crystal build --release benchmarks.cr
    $ ./benchmarks
    Generating 1000 8.0Kb lengthed strings ...
    Benchmarking Digest::CRC classes ...
                                      user     system      total        real
    Digest::CRC1#update           0.007390   0.000051   0.007441 (  0.007474)
    Digest::CRC5#update           0.033173   0.000000   0.033173 (  0.033430)
    Digest::CRC8#update           0.033643   0.000000   0.033643 (  0.033919)
    Digest::CRC81Wire#update      0.032657   0.000000   0.032657 (  0.032891)
    Digest::CRC15#update          0.050786   0.000000   0.050786 (  0.051130)
    Digest::CRC16#update          0.037301   0.000000   0.037301 (  0.037543)
    Digest::CRC16CCITT#update     0.047864   0.000000   0.047864 (  0.048261)
    Digest::CRC16DNP#update       0.039589   0.000000   0.039589 (  0.039888)
    Digest::CRC16Genibus#update   0.046829   0.000000   0.046829 (  0.047099)
    Digest::CRC16Modbus#update    0.038705   0.000000   0.038705 (  0.038995)
    Digest::CRC16QT#update        0.054050   0.000000   0.054050 (  0.054395)
    Digest::CRC16USB#update       0.039959   0.000000   0.039959 (  0.040305)
    Digest::CRC16X25#update       0.039422   0.000000   0.039422 (  0.039882)
    Digest::CRC16XModem#update    0.048175   0.000000   0.048175 (  0.048596)
    Digest::CRC16ZModem#update    0.046812   0.000000   0.046812 (  0.047062)
    Digest::CRC24#update          0.053732   0.000000   0.053732 (  0.054109)
    Digest::CRC32#update          0.037498   0.000000   0.037498 (  0.037701)
    Digest::CRC32BZip2#update     0.043699   0.000000   0.043699 (  0.044046)
    Digest::CRC32c#update         0.038263   0.000000   0.038263 (  0.038508)
    Digest::CRC32Jam#update       0.039061   0.000000   0.039061 (  0.039361)
    Digest::CRC32Mpeg#update      0.044015   0.000000   0.044015 (  0.044523)
    Digest::CRC32POSIX#update     0.043790   0.000000   0.043790 (  0.044116)
    Digest::CRC32XFER#update      0.043419   0.000000   0.043419 (  0.043683)
    Digest::CRC64#update          0.034250   0.000000   0.034250 (  0.034411)
    Digest::CRC64Jones#update     0.034213   0.000000   0.034213 (  0.034438)
    Digest::CRC64XZ#update        0.034999   0.000000   0.034999 (  0.035243)

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
