class DogsController < ApplicationController
    def index
        if params[:my_sort]
            @dogs = Dog.all.sort_by do |dog|
                dog.employees.count
            end.reverse
        else
            @dogs = Dog.all
        end
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.new(dog_params)
        if @dog.valid?
            @dog.save
            redirect_to dog_path(@dog)
        else
            flash.now[:messages] = @dog.errors.full_messages[0]
            render :new
        end
    end

    def edit
        @dog = Dog.find(params[:id])
    end

    def update
        @dog = Dog.find(params[:id])
        if @dog.update(dog_params)
            redirect_to dog_path(@dog)
        else
            flash.now[:messages] = @dog.errors.full_messages[0]
            render :edit
        end
    end

    def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy
        redirect_to dogs_path
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :breed)
    end

end
