require "active_support"
require "active_support/core_ext/integer"
require "active_support/core_ext/big_decimal"

### multiple_of? is used to check whether the given number is multiple of argument
puts 0.multiple_of?(0) #=> true
puts 4.multiple_of?(6) #=> false
puts 200000.multiple_of?(10) #=> true

### ordinal is used to return the suffix used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.
puts 1.ordinal     # => "st"
puts 2.ordinal     # => "nd"
puts 1002.ordinal  # => "nd"
puts 1003.ordinal  # => "rd"
puts (-11).ordinal   # => "th"
puts (-1001).ordinal # => "st"

### ordinalize turns a number into an ordinal string
puts 1.ordinalize     # => "1st"
puts 2.ordinalize     # => "2nd"
puts 1002.ordinalize  # => "1002nd"
puts 1003.ordinalize  # => "1003rd"
puts (-11).ordinalize   # => "-11th"
puts (-1001).ordinalize # => "-1001st"

puts BigDecimal(123456.000000000, 3).to_s("e") # => "5.0"
