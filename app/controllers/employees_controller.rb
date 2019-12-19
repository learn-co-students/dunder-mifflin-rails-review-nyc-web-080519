class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
        @dog = @employee.dog
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(employee_params)
        @dogs = Dog.all
        if @employee.save
            redirect_to employees_url
        else
            flash.now[:errors] = @employee.errors.full_messages
            render :new
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
        if @employee.update(employee_params)
            redirect_to employees_url
        else
            flash.now[:errors] = @employee.errors.full_messages
            render :edit
        end
    end

    private
    
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url,:dog_id)
    end
end
