class DogsController < ApplicationController

   def index
    @dogs = Dog.all
    @dogs = @dogs.sort_by { |a| a.employees.count }.reverse
   end 

   def show
    @dog = Dog.find(params[:id])
    @dog_employees = @dog.employees
   end
end
