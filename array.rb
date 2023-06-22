require "active_support"
require "active_support/core_ext/array"

### to returns the subarray of elements up to the one at the passed index
print %w(a b c d).to(2) # => ["a", "b", "c"]
print [].to(7)          # => []
puts

### from returns the tail from the element at the passed index to the end
print %w(a b c d).from(2)  # => ["c", "d"]
print %w(a b c d).from(10) # => []
print [].from(0)           # => []
puts

### including returns a new array that includes the passed elements
print [ 1, 2, 3 ].including(4, 5) # => [ 1, 2, 3, 4, 5 ]
print [ [ 0, 1 ] ].including([ [ 1, 0 ] ]) # => [ [ 0, 1 ], [ 1, 0 ] ]
puts

### excluding returns a copy of the Array excluding the specified elements
# It uses '-' instead of reject
print [ 1, 2, 3, 4, 5 ].excluding(4, 5) # => [ 1, 2, 3 ]
print [ [ 0, 1 ], [ 1, 0 ] ].excluding([ [ 1, 0 ] ]) # => [ [ 0, 1 ] ]
puts

### extract! removes and returns the elements for which the block returns a true value
numbers = (1..10).to_a
odd = numbers.extract! { |num| num.odd? }
print odd
print numbers
puts

# extract_options! is used to extract last element from the array if it is hash
arr_hash = [ 1, 2, 3 ].extract_options!
print arr_hash
arr_hash = [ 1, 2, 3, { a: 'abc' }, { id: 4 }].extract_options!
print arr_hash
puts

### to_sentence is used to converts the array to a comma-separated sentence
# words_connector is used to connect words other than last
# last_word_connector is used to connect last word
# two_words_connector is used when you have 2 elements in array

puts ["A", "Small", "Small", "World"].to_sentence #=> A, Small, Small, and World
puts ["A", "Small", "Small", "World"].to_sentence(words_connector: "-") #=> A-Small-Small, and World
puts ["A", "Small", "Small", "World"].to_sentence(last_word_connector: " little ") #=> A, Small, Small little World
puts ["Small", "World"].to_sentence(two_words_connector: "_") #=> Small_World

### to_fs acts like to_s by default
# If the array contains items that respond to id, however, the symbol :db may be passed as argument. That's typically used with collections of Active Record objects

### to_xml returns a string that represents the array in XML by invoking to_xml on each element
puts [1,2,3].to_xml
print [{ foo: 1, bar: 2}, { baz: 3}].to_xml
print [{ foo: 1, bar: 2}, { baz: 3}].to_xml(root: "test")
print [{ foo: 1, bar: 2}, { baz: 3}].to_xml(skip_types: true)
print [{ foo: 1, bar: 2}, { baz: 3}].to_xml(children: "test")
print [].to_xml

### Array.wrap wraps its argument in an array unless it is already an array
print Array.wrap(nil)       # => []
print Array.wrap([1, 2, 3]) # => [1, 2, 3]
print Array.wrap(0)         # => [0]
print Array.wrap(foo: :bar) # => [{:foo=>:bar}]
print Array(foo: :bar)      # => [[:foo, :bar]]
puts

### in_groups_of splits an array into consecutive groups of a certain size
# fill_with option sets the option to fill the remaining array with character

print [1, 2, 3].in_groups_of(2) #=> [[1, 2], [3, nil]]
arr = (1..10).to_a
arr.in_groups_of(3) do |a, b, c|
  print [a, b, c]
end

### in_groups splits an array into a certain number of groups
# fill_with option is also available

print (1..10).to_a.in_groups(3)
puts

### split divides an array by a separator and returns the resulting chunks

print [0, 1, -5, 1, 1, "foo", "bar"].split(1) #=> [[0], [-5], [], ["foo", "bar"]]
