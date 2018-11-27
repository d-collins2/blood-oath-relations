require_relative '../config/environment.rb'
require_relative '../app/models/bloodoath'
require_relative '../app/models/cult'
require_relative '../app/models/follower'
require "date"
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
#(name, location, founding_year, slogan)
c1 = Cult.new("Santas little helpers", "North Pole", 1901, "We Make it you buy it!")
c2 = Cult.new("Dancing Divas", "Zimbabwe",1981, "Shake your moneymaker!")
c3 = Cult.new("Dirty Little Elves", "North Pole", 1901, "Grime on our dime")
c4 = Cult.new("Santa", "North Pole", 1910, "I'm checking it twice b*&%es")
c5 = Cult.new("Toto", "Zimbabwe",1981, "Africa")

#(name, age, life_motto)
f1 = Follower.new("Rudolph", 1000, "Keep that nose red yeah yeah!")
f2 = Follower.new("Beyonce", 37, "I don't want no scrubs!")
f3 = Follower.new("Adam",25, "Don't go chasin' waterfalls")
f4 = Follower.new("Damon",27, "It's not you it's me")
f5 = Follower.new("Joyce",15, "My Code Rocks!")
f6 = Follower.new("Chris",18, "My Beard flows")
f7 = Follower.new("Tony",17, "I print lectures and learn HARDCORE.")



b1 = BloodOath.new(c1, f1)
b2 = BloodOath.new(c2, f7)
b3 = BloodOath.new(c2, f2)
b9 = BloodOath.new(c2, f7)
b8 = BloodOath.new(c2, f4)
b4 = BloodOath.new(c1, f5)
b5 = BloodOath.new(c3, f6)
b6 = BloodOath.new(c4, f7)
b7 = BloodOath.new(c4, f3)
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
