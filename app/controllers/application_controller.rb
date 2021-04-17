class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :campany, :zip_code, :prefecture_id, :city, :address, :building,
      :phone_number, :bank, :branch, :bank_type_id, :bank_number, :bank_account 
      ])
  end
end