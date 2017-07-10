class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre,:apellido,:tipo_dni,:dni,:telefono,:tipo_participacion,:tipo_institucion,:institucion,:authors_id,:centers_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre,:apellido,:tipo_dni,:dni,:telefono,:tipo_participacion,:tipo_institucion,:institucion,:authors_id,:centers_id])
    #devise_parameter_sanitizer.permit(:account_update, keys: [:nombre,:apellido,:tipo_dni,:dni,:cuit,:telefono,:tipo_beca,:organismo,:universidad,:centro,:tipo_participacion,:otro_organismo,:otra_universidad,:otro_centro])
  end

end
