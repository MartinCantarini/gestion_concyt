class OthersController < ApplicationController
  #before_action :authenticate_user!
  def home
    @tiene_poster=false;
    @prensenta_poster=false;
    @presenta_trabajo=false;
    @es_usuario=true;
    @es_organizador=false;
    @es_administrador=false;
    @cantidad_notificaciones_sin_ver=Notification.getCantSinLeeer();
    if user_signed_in?
      if current_user.rol== 1
        @es_usuario=true;
        if current_user.tipo_participacion==1
          @presenta_trabajo=true;
        if !current_user.presentation_id.blank?
    			@tiene_trabajo=true;
          if(Presentation.find(current_user.presentation_id).state_id==2 or Presentation.find(current_user.presentation_id).state_id==3)
            @prensenta_poster=true;
          end
        end
        end
      end
      if current_user.rol==2
        @es_organizador=true;
      end
      if current_user.rol== 3
        @es_administrador=true;
      end
    end
  end
  def proximamente
    @mensaje="Esta sección estará disponible proximamente"
  end
end
