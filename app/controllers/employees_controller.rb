class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
          @employee.update(employee_params)
          redirect_to employee_path(@employee)
        else
          @dogs = Dog.all
          flash.now[:messages] = @employee.errors.full_messages[0]
          render :edit
        end
    end

    def create
        @employee = Employee.create(employee_params)
    
        if @employee.valid?
          @employee.save
          redirect_to employee_path(@employee)
        else
            @dogs = Dog.all
          flash.now[:messages] = @employee.errors.full_messages[0]
          render :new
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.delete
        redirect_to dog_path(@employee.dog.id)
    end

    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
