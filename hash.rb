require "active_support"
require "active_support/core_ext/object/deep_dup"
require "active_support/core_ext/hash"

### to_xml returns a string containing an XML representation of its receiver
a= {"foo" => { a: 2}, "bar" => 2}
puts a.to_xml

### merge is used to merge two hashes
a = { a: 1, b: 2}
b = { c: 3, d: 4 } 

puts a.merge(b) #=> {:a=>1, :b=>2, :c=>3, :d=>4}
puts a.reverse_merge(b) #=> {:c=>3, :d=>4, :a=>1, :b=>2}

### reverse update is alias for reverse_merge!

### In deep merge, if a key is found in both hashes and their values are hashes in turn, then their merge becomes the value in the resulting hash
d = { c: { d: 3 } }
c = { c: { e: 2 } }
puts c.deep_merge(d) #=> {:c=>{:e=>2, :d=>3}}

### Hash#deep_dup duplicates itself and all keys and values inside recursively with Active Support method Object#deep_dup

hash = { a: 1, b: { c: 2, d: [3, 4] } }
dup = hash.deep_dup

puts hash[:b][:c] #=> 2
puts dup[:b][:c] #=> 2

hash[:b][:c] = 4

puts hash[:b][:c] #=> 4
puts dup[:b][:c] #=> 2

### except returns a hash with the keys in the argument list removed
puts a.except(:b) #=> {:a=>1}

### stringify_keys returns a hash that has a stringified version of the keys in the receiver
puts hash.stringify_keys #=> {"a"=>1, "b"=>{:c=>4, :d=>[3, 4]}}

### use deep_stringify_keys to stringify all the keys in the given hash and all the hashes nested in it
puts hash.deep_stringify_keys #=> {"a"=>1, "b"=>{"c"=>4, "d"=>[3, 4]}}

a.stringify_keys!

### symbolize_keys returns a hash that has a symbolized version of the keys in the receiver
puts a.symbolize_keys #=> {:a=>1, :b=>2}

### to_options is an aliases of symbolize_keys

### assert_valid_keys
puts a.assert_valid_keys("a", "b") #=> {"a"=>1, "b"=>2}

### deep_transform_values returns a new hash with all values converted by the block operation
puts d.deep_transform_values(&:to_s) #=> {:c=>{:d=>"3"}}

clone = a.deep_dup

### slice! replaces the hash with only the given keys and returns a hash containing the removed key/value pairs
rest = clone.slice!("a")
puts clone, rest #=> {"a"=>1}, {"b"=>2}

clone = hash.deep_dup

### extract! removes and returns the key/value pairs matching the given keys
rest = clone[:b].extract!(:d)
puts rest, clone #=> {:d=>[3, 4]}, {:a=>1, :b=>{:c=>4}}

### The method with_indifferent_access returns an ActiveSupport::HashWithIndifferentAccess out of its receiver
h = {a: 1}.with_indifferent_access
puts h["a"], h[:a] #=> 1, 1
