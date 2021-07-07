class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @dogs = Dog.all
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.first_name = params[:employee][:first_name]
        @employee.last_name = params[:employee][:last_name]
        @employee.alias = params[:employee][:alias]
        @employee.title= params[:employee][:title]
        @employee.office = params[:employee][:office]
        @employee.img_url = params[:employee][:img_url]
        @employee.dog_id = params[:employee][:dog_id]
        redirect_to employee_path(@employee)
    end

    def new
        @dogs = Dog.all
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employee_path(@employee)
        else 
            flash.now[:messages] = @employee.errors.full_messages
            @dogs = Dog.all
            render :new
        end
        # @employee.first_name = params[:employee][:first_name]
        # @employee.last_name = params[:employee][:last_name]
        # @employee.alias = params[:employee][:alias]
        # @employee.title= params[:employee][:title]
        # @employee.office = params[:employee][:office]
        # @employee.img_url = params[:employee][:img_url]
        # @employee.dog_id = params[:employee][:dog_id] 
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end
