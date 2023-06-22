require "active_support"
require "active_support/core_ext/string"

puts ' '.blank? #=> true
puts "\n \t".blank? #=> true

puts " ".present? #=> false
puts " \n ".presence.class #=> if present it returns that or else nil

### html_safe? is used to check whether the given string is insertable into HTML.
a = "abnc".html_safe
puts a.html_safe?

puts "".html_safe? #=> false
puts "".html_safe + "&" #=> &amp;
puts "".html_safe + "&".html_safe #=> &

a = 1213
puts a.to_s.html_safe?

### remove is used to remove all occerance of the pattern
# there's also remove!
puts "Hello World".remove(/Hello /) # => "World"
puts "Hello World".remove(/[a-z]/) #=> "H W"

### squish is used to remove leading and trailing whitespaces and also remove runs of spaces with single space
# there's also squish!
puts "\t \n      heloo     world   \t".squish

### truncate returns a copy of its receiver truncated after a given length
puts "Hello World! Hello! World!".truncate(20 , separator: '_', omission: '(continue)')

### truncate_bytes returns a copy of its receiver truncated to at most bytesize bytes
puts "🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪".size #=> 20
puts "🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪".bytesize #=> 80
puts "🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪".truncate_bytes(40, omission: "(..)").bytesize #=> 40

### truncate_words returns a copy of its receiver truncated after a given number of words
puts 'Once upon a time in a world far far away'.truncate_words(3)
puts 'Once<br>upon<br>a<br>time<br>in<br>a<br>world'.truncate_words(5, separator: '<br>')
puts 'Once<br>upon<br>a<br>time<br>in<br>a<br>world'.truncate_words(5, separator: '<br>', omission: ".bye!")

### Inquiry? wraps the current string in the ActiveSupport::StringInquirer class, which gives you a prettier way to test for equality
puts env = 'production'.inquiry
puts env.class #=> ActiveSupport::StringInquirer
puts env.production?  # => true
puts env.development? # => false

### starts_with? & ends_with?
puts "foo".starts_with?("f") #=> true
puts "foo".ends_with?("o") #=> true

### indent is used to give indentation to the string, indent(no. of indentation, string to indent with(indent_string), indent empty lines in string(indent_empty_lines))
puts "foo\n\nboo".indent(2, '\t', true)

### At is used to get character at that position
puts "hello".at(2) #=> l
### From is used to get character from that position
puts "hello".from(2) #=> llo
### To is used to get character to that position
puts "hello".to(2) #=> hel
### First is used to get characters till n-1 position
puts "hello".first(2) #=> he
### Last is used to get characters from n+1 position
puts "hello".last(2) #=> lo

### Pluralize is used to make the string plural
# It also has count option, if count == 1 than it returns singular value.
# It also has locale option to returns string in that language.
puts "hello".pluralize

### Singularize is inverse of pluralize
# It also has locale option to returns string in that language.
puts "images".singularize

### camelize returns its receiver in camel case
puts 'hello_world'.camelize #=> HelloWorld
puts 'hello_world'.camelize(:lower) #=> helloWorld

### underscore is the reverse of camelize
puts "HelloWorld".underscore #=> hello_world
puts "A::B".underscore #=> a/b

### titleize capitalizes the words in the receiver
puts "this is example".titleize #=> "This Is Example"
puts "this is example with id".titleize #=> "This Is Example With"
puts "this is example with id".titleize(keep_id_suffix: true) #=> "This Is Example With Id"

### dasherize replaces the underscores in the receiver with dashes
puts 'hello_world'.dasherize #=> hello-world

### demodulize returns the very constant name i.e. the rightmost part of it.
puts "Product".demodulize                        # => "Product"
puts "Backoffice::UsersController".demodulize    # => "UsersController"

### deconstantize removes the rightmost segment
puts "Product".deconstantize                        # => ""
puts "Backoffice::UsersController".deconstantize    # => "Backoffice"

### parameterize normalizes its receiver in a way that can be used in pretty URLs
puts "John Smith".parameterize # => "john-smith"
puts "John Smith".parameterize(preserve_case: true) # => "John-Smith"
puts "John Smith".parameterize(separator: '/') # => "john/smith"

### tableize is underscore followed by pluralize
puts "HelloWorld".tableize #=> hello_worlds

### classify is the inverse of tableize
puts 'ham_and_eggs'.classify #=> HamAndEgg

### constantize tries to find a declared constant with the name specified in the string. It raises a NameError when the name is not in CamelCase or is not initialized

puts "Integer".constantize # => Integer

module M
  X = 1
end
puts "M::X".constantize # => 1

### humanize tweaks an attribute name for display to end users.
# Applies human inflection rules to the argument.
# Deletes leading underscores, if any.
# Removes a "_id" suffix if present.
# Replaces underscores with spaces, if any.
# Downcases all words except acronyms.
# Capitalizes the first word

puts "name".humanize                         # => "Name"
puts "author_id".humanize                    # => "Author"
puts "author_id".humanize(capitalize: false) # => "author"
puts "comments_count".humanize               # => "Comments count"
puts "_id".humanize                          # => "Id"
puts 'author_id'.humanize(keep_id_suffix: true)   #  => "Author id"

# foreign_key creates a foreign key name from a class name

puts 'Message'.foreign_key        # => "message_id"
puts 'Message'.foreign_key(false) # => "messageid"
puts 'Admin::Post'.foreign_key    # => "post_id"

# to_date, to_time, to_datetime
puts "1-1-2012".to_date   # => Sun, 01 Jan 2012
puts "01/01/2012".to_date # => Sun, 01 Jan 2012
puts "2012-12-13".to_date # => Thu, 13 Dec 2012
# puts "12/13/2012".to_date # => ArgumentError: invalid date

puts "1-1-2012".to_datetime            # => Sun, 01 Jan 2012 00:00:00 +0000
puts "01/01/2012 23:59:59".to_datetime # => Sun, 01 Jan 2012 23:59:59 +0000
puts "2012-12-13 12:50".to_datetime    # => Thu, 13 Dec 2012 12:50:00 +0000
# "12/13/2012".to_datetime          # => ArgumentError: invalid date

puts "13-12-2012".to_time               # => 2012-12-13 00:00:00 +0530
puts "06:12".to_time                    # => 2012-12-13 06:12:00 +0530
puts "2012-12-13 06:12".to_time         # => 2012-12-13 06:12:00 +0530
puts "2012-12-13T06:12".to_time         # => 2012-12-13 06:12:00 +0530
puts "2012-12-13T06:12".to_time(:utc)   # => 2012-12-13 06:12:00 UTC
# "12/13/2012".to_time               # => ArgumentError: argument out of range
# "1604326192".to_time               # => ArgumentError: argument out of range

### strip_heredoc strips indentation in heredocs

a = <<-HTML
    This
    is
    a
    heredoc
HTML

puts a.strip_heredoc
