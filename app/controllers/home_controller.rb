class HomeController < ApplicationController

  before_filter :authenticate_user!, only: [:index, :new]

  # Index action.
  def index
  end
end
