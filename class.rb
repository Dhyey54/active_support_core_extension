require "active_support"
require "active_support/core_ext/class"

### class_attribute is used to set a class attribute which can be inherited and can be changed as well.
# writer instance method can be prevented by setting the option :instance_writer to false
# reader instance method can be prevented by setting the option :instance_reader to false

class A
  class_attribute :x
end

class B < A; end

class C < B; end

class D < A; end

puts A.x = :a
puts B.x # => :a
puts C.x # => :a

puts B.x = :b
puts A.x # => :a
puts C.x # => :b

puts C.x = :c
puts A.x # => :a
puts B.x # => :b

### Subclasses and descendants
p A.subclasses #=> [D, B]
p B.subclasses #=> [C]
p C.subclasses #=> []

p A.descendants #=> [D, B, C]
p B.descendants #=> [C]
p C.descendants #=> []
