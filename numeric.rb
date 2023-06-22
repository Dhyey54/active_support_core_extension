require "active_support"
require "active_support/core_ext/numeric"

puts 1.bytes
puts 1.kilobytes
puts 1.megabytes
puts 1.gigabytes
puts 1.terabytes
puts 1.petabytes
puts 1.exabytes

### formatting
# phone number:
puts 5551234.to_fs(:phone)                                     # => "555-1234"
puts 1235551234.to_fs(:phone)                                  # => "123-555-1234"
puts 1235551234.to_fs(:phone, area_code: true)                 # => "(123) 555-1234"
puts 1235551234.to_fs(:phone, delimiter: ' ')                  # => "123 555 1234"
puts 1235551234.to_fs(:phone, area_code: true, extension: 333) # => "(123) 555-1234 x 555"
puts 1235551234.to_fs(:phone, country_code: 91)                 # => "+91-123-555-1234"
puts 1235551234.to_fs(:phone, country_code: 91, extension: 1343, delimiter: '_') # => "+91_123_555_1234 x 1343"

# currency:
puts 1234567890.50.to_fs(:currency)                     # => "$1,234,567,890.50"
puts 1234567890.506.to_fs(:currency)                    # => "$1,234,567,890.51"
puts 1234567890.506.to_fs(:currency, precision: 3)      # => "$1,234,567,890.506"
puts 1234567890.506.to_fs(:currency, round_mode: :down) # => "$1,234,567,890.50"
# puts 1234567890.506.to_fs(:currency, locale: :fr)       # => "1 234 567 890,51 €"
puts -1234567890.50.to_fs(:currency, negative_format: '(%u%n)') # => "($1,234,567,890.50)"
puts 1234567890.50.to_fs(:currency, unit: '&pound;', separator: ',', delimiter: '') # => "&pound;1234567890,50"
puts 1234567890.50.to_fs(:currency, unit: '&pound;', separator: ',', delimiter: '', format: '%n %u') # => "1234567890,50 &pound;"

# percentage
puts 100.to_fs(:percentage)                                  # => "100.000%"
puts 100.to_fs(:percentage, precision: 0)                    # => "100%"
puts 1000.to_fs(:percentage, delimiter: '.', separator: ',') # => "1.000,000%"
puts 302.24398923423.to_fs(:percentage, precision: 5)        # => "302.24399%"
puts 302.24398923423.to_fs(:percentage, round_mode: :down)   # => "302.243%"
# 1000.to_fs(:percentage, locale: :fr)                    # => "1 000,000%"
puts 100.to_fs(:percentage, format: '%n  %')                 # => "100.000  %"

# delimited:
puts 12345678.to_fs(:delimited)                     # => "12,345,678"
puts 12345678.05.to_fs(:delimited)                  # => "12,345,678.05"
puts 12345678.to_fs(:delimited, delimiter: '.')     # => "12.345.678"
puts 12345678.to_fs(:delimited, delimiter: ',')     # => "12,345,678"
puts 12345678.05.to_fs(:delimited, separator: ' ')  # => "12,345,678 05"
# 12345678.05.to_fs(:delimited, locale: :fr)     # => "12 345 678,05"
puts 98765432.98.to_fs(:delimited, delimiter: ' ', separator: ',') # => "98 765 432,98"

# rounded:
puts 111.2345.to_fs(:rounded)                                      # => "111.235"
puts 111.2345.to_fs(:rounded, precision: 2)                        # => "111.23"
puts 111.2345.to_fs(:rounded, precision: 2, round_mode: :up)       # => "111.24"
puts 13.to_fs(:rounded, precision: 5)                              # => "13.00000"
puts 389.32314.to_fs(:rounded, precision: 0)                       # => "389"
puts 111.2345.to_fs(:rounded, significant: true)                   # => "111"
puts 111.2345.to_fs(:rounded, precision: 1, significant: true)     # => "100"
puts 13.to_fs(:rounded, precision: 5, significant: true)           # => "13.000"
# 111.234.to_fs(:rounded, locale: :fr)                          # => "111,234"
puts 13.to_fs(:rounded, precision: 5, significant: true, strip_insignificant_zeros: true) # => "13"
puts 389.32314.to_fs(:rounded, precision: 4, significant: true)    # => "389.3"
puts 1111.2345.to_fs(:rounded, precision: 2, separator: ',', delimiter: '.') # => "1.111,23"

# Human-friendly format:
puts 123.to_fs(:human)                                       # => "123"
puts 1234.to_fs(:human)                                      # => "1.23 Thousand"
puts 12345.to_fs(:human)                                     # => "12.3 Thousand"
puts 1234567.to_fs(:human)                                   # => "1.23 Million"
puts 1234567890.to_fs(:human)                                # => "1.23 Billion"
puts 1234567890123.to_fs(:human)                             # => "1.23 Trillion"
puts 1234567890123456.to_fs(:human)                          # => "1.23 Quadrillion"
puts 1234567890123456789.to_fs(:human)                       # => "1230 Quadrillion"
puts 489939.to_fs(:human, precision: 2)                      # => "490 Thousand"
puts 489939.to_fs(:human, precision: 2, round_mode: :down)   # => "480 Thousand"
puts 489939.to_fs(:human, precision: 4)                      # => "489.9 Thousand"
puts 1234567.to_fs(:human, precision: 4, significant: false) # => "1.2346 Million"
puts 1234567.to_fs(:human, precision: 1, separator: ',', significant: false) # => "1,2 Million"
