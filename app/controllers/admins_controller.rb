class AdminsController < ApplicationController

  before_filter :authenticate_admin!, only: [:index, :new]

  # Index action for Admins.
  def index
  end
end
