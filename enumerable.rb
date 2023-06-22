require "active_support"
require "active_support/core_ext"

### sum adds the elements of an enumerable
# it works with '+' operator b/w elements

print [1,2,3].sum #=> 6
print (1..10).sum #=> 5050

# print [[1,2],[2,3],[3,4]].sum #=> [1,2,2,3,3,4]
# print %w(foo bar baz).sum # => "foobarbaz"
# a ={a: 1, b: 2, c: 3}
# print a.sum # => [:a, 1, :b, 2, :c, 3]

print [].sum #=> 0
print [].sum(2) #=> 2

puts (1..5).sum {|n| n / 2 } #=> 6

### index_by Convert an enumerable to a hash, using the block result as the key and the element as the value
print (1..5).index_by(&:to_s)

### index_with Convert an enumerable to a hash, using the element as the key and the block result as the value
print (1..5).index_with {|n| n**2}

### many? Returns true if the enumerable has more than 1 element
puts (1..5).many? { |n| n < 2 } #=> false
puts (1..5).many? { |n| n < 3 } #=> true

### exclude? is opposite of include?
puts (1..5).exclude?(6)

### including returns a new enumerable that includes the passed elements
print [ 1, 2, 3 ].including(4, 5)

puts
### excluding returns a copy of an enumerable with the specified elements removed
print ["David", "Rafael", "Aaron", "Todd"].excluding("Aaron", "Todd")
puts

### pluck extracts the given key from each element
print [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pluck(:name)
print [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pluck(:id, :name)
puts

### pick extracts the given key from the first element
print [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pick(:name) # => "David"
print [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pick(:id, :name) # => [1, "David"]
puts
