class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        items_path
    end

    def after_sign_out_path_for(resource)
        new_user_session_path
    end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :company, :zip_code, :prefecture_id, :city, :address, :building,
      :phone_number, :bank, :branch, :bank_type_id, :bank_number, :bank_account 
      ])
  end
end