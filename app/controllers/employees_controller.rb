class EmployeesController < ApplicationController

  before_filter :authenticate_employee!, only: [:index, :new]

  # Index action for Employees.
  def index
  end
end
