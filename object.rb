require "active_support"
require "active_support/core_ext"

puts "abc".duplicable? #=> true
puts 1.duplicable? #=> true
puts [].duplicable? #=> true
puts {}.duplicable? #=> true
puts "abc".method(:+).duplicable? #=> false

# Duplicate
array     = ['string']
duplicate = array.dup

duplicate.push 'another-string'
print array     # => ['string']
puts
print duplicate # => ['string', 'another-string']
puts
print array.first.gsub!('string', 'foo')
puts
# first element was not duplicated, it will be changed in both arrays
print array     # => ['foo']
puts
print duplicate # => ['foo', 'another-string']

# Deep Duplicate
array     = ['string']
duplicate = array.deep_dup

duplicate.push 'another-string'
print array     # => ['string']
puts
print duplicate # => ['string', 'another-string']
puts
print array.first.gsub!('string', 'foo')
puts
# first element was not duplicated, it will be changed in both arrays
print array     # => ['foo']
puts
print duplicate # => ['string', 'another-string']

# Try Method

@obj = nil

# @obj.next #=> error
@obj.try!(:next) #=> return the value or else nil
@obj.try { |p| "#{p.first_name} #{p.last_name}" }
# @obj = 1
# @obj.try!(:jest) #=> It will throw error if wrong method name

# Acts Like Method
# Works only for Date, Time and String

class Test
  def acts_like_date?
  end
end

d1 = Date.new
t1 = d1.clone
test = Test.new

puts test.acts_like?(:date) #=> true
puts d1.acts_like?(:time) #=> false
puts t1.acts_like?(:date) #=> true as t1 is clone of d1 which is a date object

### To Param
# It changes the value to query string
# It calls to_s method

puts 7.to_param #=> "7"
puts nil.to_param #=> nil class
puts true.to_param #=> true class
puts false.to_param #=> false class
puts [0, true, String].to_param # => "0/true/String"
h = {a: 1}
puts h.to_param #=> "a=1"

### To Query
# It returns the value of string that associates a given key with the return value of to_param 

puts 7.to_query(1) #=> 1="7"
puts nil.to_query(1) #=> 1=nil class
puts true.to_query(1) #=> 1=true class
puts false.to_query(1) #=> 1=false class
puts [0, true, String].to_query(1) # => 1%5B%5D=0&1%5B%5D=true&1%5B%5D=String
h = {a: 1}
puts h.to_query(1) #=> 1%5Ba%5D=1

### To Json

puts h.to_json #=> {"a":1}
puts a: [0, true, String, "abc"].to_json # => {:a=>"[0,true,\"String\",\"abc\"]"}


### Instance Variable

class C
  def initialize(x, y)
    @x, @y = x, y
  end
end

puts C.new(0, 1).instance_values # => {"x" => 0, "y" => 1}
print C.new(0, 1).instance_variable_names # => ["@x", "@y"]
puts

### Silencing Warnings and Exceptions
# It is used to silence the warning thrown during evaluation

suppress(NoMethodError) do
  nil.next
end

### In?
# It is used to check if the object is included in another object
# The argument should have inlcude? method

# puts 1.in?(1) #=> Argument Error
puts 1.in?([1,2,3]) #=> true
