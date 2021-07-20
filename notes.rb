# Keyword Arguments: 
# Are a special way of passing arguments into a method. They behave like hashes, pairing a key that functions as the parameter name with its value. 

def happy_birthday(name: "Beyonce", current_age: 31)
  puts "Happy Birthday, #{name}"
  current_age += 1
  puts "You are now #{current_age} years old"
end
# ^ Here, we've defined our method to take in keyword arguments. Our keyword arguments consist of two key/value pairs, :name and :current_age. We've given our keyword arguments default values of "Beyonce" and 31, but we didn't have to:

def happy_birthday(name:, current_age:)
  puts "Happy Birthday, #{name}"
  current_age += 1
  puts "You are now #{current_age} years old"
end 

# ^ Notice that we can reference name and current_age inside our method body, as if they were barewords, even though they are the keys in our keyword arguments. That's how keyword arguments work, they allow you to name the arguments that you pass in as keys in a hash. Then, the method body can use the values of those keys, referenced by their name. Let's call our method:
happy_birthday(current_age: 31, name: "Carmelo Anthony")
=> Happy Birthday, Carmelo Anthony
=> You are now 32 years old 

# Notice that even though we changed the order of our key/value pairs, our method didn't break! Not only is this method more robust (i.e. more resistant to breakage) than the version using positional arguments, it is also more explicit. Anyone looking at its invocation can tell exactly what kind of data you are passing in.

# Mass Assignment:

# Another benefit of using keyword arguments is the ability to "mass assign" attributes to an object. Let's revisit our Person class from an earlier lesson. We'd like to initialize individual people with a name and an age:

class Person
  attr_accessor :name, :age

  def initialize(name:, age:)
    @name = name
    @age = age
  end
end 

# ^ Now, we have the added benefit of being able to use something called mass assignment to instantiate new people objects. If a method is defined to accept keyword arguments, we can create the hash that the method is expecting to accept as an argument, set that hash equal to a variable, and simply pass that variable in to the method as an argument. Let's take a look:

person_attributes = { name: "Sophie", age: 26 }
sophie = Person.new(person_attributes)
# => <Person:0x007f9bd5814ae8 @name="Sophie", @age=26> 

# Note: Starting with Ruby version 3, the use of a hash for keyword arguments will be deprecated, so the code above will throw an error message. To get around this error, you can use the double splat operator (**) to convert a hash to keyword arguments: see bookmarked website. 

person_attributes = { name: "Sophie", age: 26 }
sophie = Person.new(**person_attributes) 

# Using keyword arguments makes our Ruby methods more flexible by allowing arguments to be passed in any order, and by allowing our methods to receive a hash of key-value pairs as arguments.











