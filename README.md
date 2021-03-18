# crc.cr

* [Source](https://github.com/postmodern/crc.cr)
* [Issues](https://github.com/postmodern/crc.cr/issues)
* [Docs](https://postmodern.github.io/docs/crc.cr/index.html)

CRC (Cyclic Redundancy Check) algorithms for [Crystal][crystal]. Based on the
[digest-crc] Ruby library and should be API compatible.

## Features

* Provides support for the following CRC algorithms:
  * `CRC1`
  * `CRC5`
  * `CRC8`
  * `CRC8_1Wire`
  * `CRC15`
  * `CRC16`
  * `CRC16CCITT`
  * `CRC16DNP`
  * `CRC16Genibus`
  * `CRC16Kermit`
  * `CRC16Modbus`
  * `CRC16USB`
  * `CRC16X25`
  * `CRC16XModem`
  * `CRC16ZModem`
  * `CRC16QT`
  * `CRC24`
  * `CRC32`
  * `CRC32c`
  * `CRC32BZip2`
  * `CRC32Jam`
  * `CRC32MPEG`
  * `CRC32POSIX`
  * `CRC32XFER`
  * `CRC64`
  * `CRC64Jones`
  * `CRC64XZ`
* Pure Crystal implementation.
* Uses Crystal's [Digest] class.
* Provides CRC Tables for optimized calculations.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     crc:
       github: postmodern/crc.cr
   ```

2. Run `shards install`

## Examples

Calculate a CRC32:

```crystal
require "digest/crc32"

CRC::CRC32.hexdigest("hello")
# => "3610a686"
```

Calculate a CRC32 of a file:

```crystal
CRC::CRC32.file("README.md")
# => #<CRC::CRC32: 127ad531>
```

Incrementally calculate a CRC32:

```crystal
crc = CRC::CRC32.new
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

module CRC
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
    Benchmarking CRC classes ...
                                      user     system      total        real
    CRC1#update           0.007390   0.000051   0.007441 (  0.007474)
    CRC5#update           0.033173   0.000000   0.033173 (  0.033430)
    CRC8#update           0.033643   0.000000   0.033643 (  0.033919)
    CRC81Wire#update      0.032657   0.000000   0.032657 (  0.032891)
    CRC15#update          0.050786   0.000000   0.050786 (  0.051130)
    CRC16#update          0.037301   0.000000   0.037301 (  0.037543)
    CRC16CCITT#update     0.047864   0.000000   0.047864 (  0.048261)
    CRC16DNP#update       0.039589   0.000000   0.039589 (  0.039888)
    CRC16Genibus#update   0.046829   0.000000   0.046829 (  0.047099)
    CRC16Modbus#update    0.038705   0.000000   0.038705 (  0.038995)
    CRC16QT#update        0.054050   0.000000   0.054050 (  0.054395)
    CRC16USB#update       0.039959   0.000000   0.039959 (  0.040305)
    CRC16X25#update       0.039422   0.000000   0.039422 (  0.039882)
    CRC16XModem#update    0.048175   0.000000   0.048175 (  0.048596)
    CRC16ZModem#update    0.046812   0.000000   0.046812 (  0.047062)
    CRC24#update          0.053732   0.000000   0.053732 (  0.054109)
    CRC32#update          0.037498   0.000000   0.037498 (  0.037701)
    CRC32BZip2#update     0.043699   0.000000   0.043699 (  0.044046)
    CRC32c#update         0.038263   0.000000   0.038263 (  0.038508)
    CRC32Jam#update       0.039061   0.000000   0.039061 (  0.039361)
    CRC32Mpeg#update      0.044015   0.000000   0.044015 (  0.044523)
    CRC32POSIX#update     0.043790   0.000000   0.043790 (  0.044116)
    CRC32XFER#update      0.043419   0.000000   0.043419 (  0.043683)
    CRC64#update          0.034250   0.000000   0.034250 (  0.034411)
    CRC64Jones#update     0.034213   0.000000   0.034213 (  0.034438)
    CRC64XZ#update        0.034999   0.000000   0.034999 (  0.035243)

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
[Digest]: https://crystal-lang.org/api/Digest.html
