class UsersController < ApplicationController
  before_action do
    redirect_to items_path if current_user
  end

  def index
  end

end
