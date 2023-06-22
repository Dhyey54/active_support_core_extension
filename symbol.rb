require "active_support"
require "active_support/core_ext/symbol"

puts :foo.starts_with?("f") # => true
puts :foo.ends_with?("o")   # => true
