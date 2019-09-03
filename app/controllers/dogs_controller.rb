class DogsController < ApplicationController

  def index 
    @dogs = Dog.all
  end

  def sort 
    @dogs = Dog.all
    @sort_dogs = @dogs.sort_by {|dog| dog.employees.count}.reverse
  end

  def show
    @dog = Dog.find(params[:id])
  end

end
