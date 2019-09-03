class DogsController < ApplicationController

  def index
    if params[:sorted] == "true"
      @dogs = Dog.order_by_count_of_humans(Employee.all)
    else
      @dogs = Dog.all
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  # def sort
  #   @sorted_dogs = Dog.order_by_count_of_humans(Employee.all)
  #   render :index
  # end

end
