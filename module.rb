require "active_support"
require "active_support/core_ext"

### alias_attribute is used to give subclass attribute an alias

# alias_attribute :login, :email #=> This way we can access the email column as login

### module_parent is used to get parent module

module X
  module Y
    module Z
    end
  end
end

M = X::Y::Z
N = X::Y
O = X

puts X::Y::Z.module_parent # => X::Y
puts M.module_parent       # => X::Y
puts N.module_parent       # => X
puts O.module_parent       # => Object

### module_parent_name is used to get the name of the parent module
p X::Y::Z.module_parent_name # => X::Y
p M.module_parent_name       # => X::Y
p N.module_parent_name       # => X
p O.module_parent_name       # => nil

### anonymous? is used to check if the module have a name or not
puts M.anonymous?
puts Module.new.anonymous?

### delegate is used to easy way to forward methods

# class User < ApplicationRecord
#   has_one :profile

#   def name
#     profile.name
#   end

#   Above name method can be done easily using delegate

#   delegate :name, to: :profile, allow_nil: true, prefix: true, private: true
#   allow_nil is used to not raise error if the value is nil
#   prefix is used to prefix the name to delegated class
#   prefix: :avatar can be used to set custom prefix
#   private: true is used if the method is set if the method accessed is private
# end

### delegate_missing_to is used to delegate everything missing from one object, to the another one.

# delegate_missing_to :profile
