class OthersController < ApplicationController
  #before_action :authenticate_user!
  def home
    @tiene_poster=false;
    @presenta_poster=false;
    @presenta_trabajo=false;
    @es_usuario=true;
    @es_evaluador_formato=false;
    @es_evaluador_trabajo=false;
    @es_administrador=false;
    if user_signed_in?
      @cantidad_notificaciones_sin_ver=Notification.getCantSinLeeer(current_user.id);
      if current_user.tipo_participacion==2
        id_centro=current_user.centers_id
        centro=Center.find(id_centro)
        if (centro.inscripto==0)
          centro.inscripto=1
          centro.save
        end
      end
    end
    #Está registrado
    if user_signed_in?
      #Es un usuario normal
      if current_user.rol== 1
        @es_usuario=true;
        #Es usuario con participación Autor o Póster
        if current_user.tipo_participacion==1 or current_user.tipo_participacion==2
          @presenta_trabajo=true;
          #Ya presentó trabajo por primera vez
          if !current_user.presentation_id.blank?
      			@tiene_trabajo=true;
            @tiene_correcciones=Notification.getTiene(current_user.presentation_id);
            #Es usuario con participación Póster
            if(current_user.tipo_participacion==2)
              if(Presentation.find(current_user.presentation_id).state_id==2 or Presentation.find(current_user.presentation_id).state_id==3)
                @presenta_poster=true;
                #Ya comenzó posters
                if !current_user.poster_id.blank?
                  @tiene_poster=true;
                end
              end
            end
          end
        end
      elsif current_user.rol==2
        @es_evaluador_formato=true;
      elsif current_user.rol== 3
        @es_evaluador_trabajo=true;
      else
        @es_administrador=true;
      end
    end
  end
  def proximamente
    @mensaje="Esta sección estará disponible proximamente"
  end
end
