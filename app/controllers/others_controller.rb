class OthersController < ApplicationController
#before_action :authenticate_user!
  def home
  	if user_signed_in?
      @tiene_poster=false;
  		if !current_user.poster_id.blank?
  			@tiene_poster=true;
  		end
  	end
  end
  def proximamente
    @mensaje="Esta sección estará disponible luego de finalizado el Congreso"
  end
end
