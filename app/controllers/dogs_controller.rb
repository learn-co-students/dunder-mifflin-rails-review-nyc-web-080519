class DogsController < ApplicationController

    def index
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new
    end

    def edit
        @dog = Dog.find(params[:id])
        @employees = Employee.all
        if @dog.valid?
            @dog.save
            redirect_to dog_path(@dog)
          else
            flash.now[:messages] = @dog.errors.full_messages[0]
            @employees = Employee.all
            render :new
          end
    end

    def create
        @dog = Dog.create(params[:id])
        if @dog.valid?
            @dog.save
            redirect_to dog_path(@dog)
          else
            flash.now[:messages] = @dog.errors.full_messages[0]
            @employees = Employee.all
            render :new
          end
    end

    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params)
        redirect_to dog_path(dog)
    end

    def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy
        redirect_to dogs_path
    end

    #----------------------PARAMS-------------------------------
    def dog_params
        params.require[:dog].permit[:name, :breed, :age]
    end

end
