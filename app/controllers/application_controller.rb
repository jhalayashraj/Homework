class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :email, :password, :city, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :email, :password, :city, :role])
  end

  def only_see_own_page
    if current_user.id != params[:id]
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
end
