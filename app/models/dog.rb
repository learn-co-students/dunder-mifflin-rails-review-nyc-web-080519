class Dog < ApplicationRecord
  has_many :employees

 def self.order_by_count_of_humans(humans_arr)
  output_arr = []
  output_hash = Hash.new(0)
  humans_arr.each { |human| output_hash[human.dog_id] += 1 }
  sorted_arr = output_hash.sort_by { |k,v| v }.reverse.to_h.keys
  sorted_arr.each { |dogid| output_arr << Dog.find(dogid)}
  output_arr
 end


end
