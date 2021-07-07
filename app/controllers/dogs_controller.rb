class DogsController < ApplicationController

    def index
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
        @owners = Employee.all.select {|owner| owner.dog_id == @dog.id}
    end

    private

    def dog_params
        params.require(:dogs).permit(:name, :breed, :age)
    end
end