require "active_support"
require "active_support/core_ext/regexp"
require "active_support/core_ext"

### multiline?() returns true if the regexp has the multiline flag set

puts (/./).multiline?  # => false
puts (/./m).multiline? # => true

puts Regexp.new(".").multiline?                    # => false
puts Regexp.new(".", Regexp::MULTILINE).multiline? # => true

### === and include? is used to test whether the range is included in another
puts (1..10) === (3..7)  # => true
puts (1..10) === (0..7)  # => false
puts (1..10) === (3..11) # => false
puts (1...9) === (3..9)  # => false

puts (1..10).include?(3..7)  # => true
puts (1..10).include?(0..7)  # => false
puts (1..10).include?(3..11) # => false
puts (1...9).include?(3..9)  # => false

### overlaps? says whether any two given ranges have non-void intersection
puts (1..10).overlaps?(7..11)  # => true
puts (1..10).overlaps?(0..7)   # => true
puts (1..10).overlaps?(11..27) # => false
