class PresentationsController < ApplicationController
  before_action :authenticate_user!
  def show
    @puede_modificar=false;
    @puede_enviar_correccion=false;
    @puede_evaluar=false;
    @puede_seleccionar_evaluador=false;
    #Puedo ver la presentación si le pertenece al usuario actual, o si soy organizador o admin
    # Presentation.find(params[:id]).id
    if Presentation.exists?(params[:id])
      @presentacion_a_editar=Presentation.find(params[:id])
      @usuarios_editores=User.where("rol = ? or rol = ?",2,3)
      if current_user.presentation_id==Presentation.find(params[:id]).id or current_user.rol==2 or current_user.rol==3
        @presentacion=Presentation.find(params[:id])
        @notificaciones=Notification.where("presentation_id = ? AND leido = 0 AND para_administrador = false",@presentacion.id).order('created_at DESC')
        if current_user.rol==2 or current_user.rol==3
          @puede_enviar_correccion=true;
          @puede_seleccionar_evaluador=true;
          if current_user.rol==3
            @puede_evaluar=true;
          # else
          end
        end
        if(Presentation.find(params[:id]).state_id == 1 or Presentation.find(params[:id]).state_id == 5)
          if current_user.presentation_id==Presentation.find(params[:id]).id
            @puede_modificar=true;
          end
        end
      else
        flash[:alert]="Usted no tiene permiso para estar aquí"
        redirect_to :root
      end
    else
      flash[:alert]="Usted no tiene permiso para estar aquí"
      redirect_to :root
    end
  end

  def index
    if current_user.rol==2 or current_user.rol==3 or current_user.rol==4
      if current_user.rol==4
        if params[:s]=='1'
          @presentaciones=Presentation.where("state_id = ?",1).order('created_at ASC')
        elsif params[:s]=='2'
          @presentaciones=Presentation.where("state_id = ?",2).order('created_at ASC')
        elsif params[:s]=='3'
          @presentaciones=Presentation.where("state_id = ?",3).order('created_at ASC')
        elsif params[:s]=='4'
          @presentaciones=Presentation.where("state_id = ?",4).order('created_at ASC')
        else
          @presentaciones=Presentation.all
        end
        @cantidad_presentaciones=Presentation.all.count
        @cantidad_presentaciones_evaluacion=Presentation.where("state_id = ?",1).count
        @cantidad_presentaciones_aprobados=Presentation.where("state_id = ?",2).count
        @cantidad_presentaciones_seleccionados=Presentation.where("state_id = ?",3).count
        @cantidad_presentaciones_desaprobados=Presentation.where("state_id = ?",4).count
      else
        if params[:s]=='1'
          @presentaciones=Presentation.where("state_id = ? and user_id = ?",1,current_user.id).order('created_at ASC')
        elsif params[:s]=='2'
          @presentaciones=Presentation.where("state_id = ? and user_id = ?",2,current_user.id).order('created_at ASC')
        elsif params[:s]=='3'
          @presentaciones=Presentation.where("state_id = ? and user_id = ?",3,current_user.id).order('created_at ASC')
        elsif params[:s]=='4'
          @presentaciones=Presentation.where("state_id = ? and user_id = ?",4,current_user.id).order('created_at ASC')
        else
          @presentaciones=Presentation.where("user_id = ?",current_user.id).order('created_at ASC')
        end
        @cantidad_presentaciones=Presentation.where("user_id = ?",current_user.id).count
        @cantidad_presentaciones_evaluacion=Presentation.where("state_id = ? and user_id = ?",1,current_user.id).count
        @cantidad_presentaciones_aprobados=Presentation.where("state_id = ? and user_id = ?",2,current_user.id).count
        @cantidad_presentaciones_seleccionados=Presentation.where("state_id = ? and user_id = ?",3,current_user.id).count
        @cantidad_presentaciones_desaprobados=Presentation.where("state_id = ? and user_id = ?",4,current_user.id).count
      end
    else
      flash[:alert]="Usted no tiene permiso para estar aquí"
      redirect_to :root
    end
  end

  def new
    @presentacion=Presentation.new
  end

  def create
    @presentacion=Presentation.new(params_presentation)
    if @presentacion.save
      flash[:notice]="Su Presentación de Trabajo ha sido creada con Éxito"
      usuario=User.find(current_user.id)
      usuario.presentation_id=@presentacion.id
      usuario.save
      # Notification.create(cuerpo:"El usuario ha subido por primera vez su Trabajo",para_administrador:true,presentation_id:@presentacion.id,session_id:@presentacion.session_id)
      redirect_to presentation_path(@presentacion.id)
    else
      flash[:alert]="No se pudo crear su Presentación de Trabajo, por favor intente nuevamente"
      redirect_to new_presentation_path
    end
  end

  def edit
    if Presentation.exists?(params[:id]) and current_user.presentation_id==Presentation.find(params[:id]).id
      @presentacion=Presentation.find(params[:id])
    else
      flash[:alert]="Usted no tiene permiso para estar aquí"
      redirect_to :root
    end
  end

  def update
    @presentacion=Presentation.find(params[:id])
    if(@presentacion.update(params_presentation))
      flash[:notice]="Su Presentación de Trabajo ha sido modificada con Éxito"
      usuario=User.find(current_user.id)
      usuario.presentation_id=@presentacion.id
      usuario.save
      # Notification.create(cuerpo:"El usuario ha modificado su Trabajo",para_administrador:true,presentation_id:@presentacion.id,session_id:@presentacion.session_id)
      redirect_to presentation_path(@presentacion.id)
    else
      flash[:alert]="No se pudo modificar su Presentación de Trabajo, por favor intente nuevamente"
      redirect_to edit_presentation_path(@presentacion.id)
    end
  end

  def destroy
    @presentacion=Presentation.find(params[:id])
    id_presentacion=@presentacion.id
    if(@presentacion.destroy)
      FileUtils.rm_rf('public/images/presentaciones/'+id_presentacion.to_s)
      flash[:notice]="La Presentación ha sido eliminada con éxito"
      redirect_to :root
    else
      flash[:alert]="No se pudo eliminar la Presentación, por favor intente nuevamente"
      redirect_to :root
    end
  end

  def change_state
    @presentacion=Presentation.find(params[:id])
    @presentacion.state_id=params[:id_state].to_i
    if @presentacion.save
      flash[:notice]="El estado de la Presentación ha sido modificado con éxito"
    else
      flash[:notice]="El estado de la Presentación no pudo ser modificado, por favor intente nuevamente"
    end
    redirect_to presentation_path(params[:id])
  end

  def change_user_correccion
    @presentacion=Presentation.find(params[:id_presentacion])
    @presentacion.user_id=params[:id_usuario_correccion]
    if(@presentacion.user_id==1)
      #Soy evaluado de formato
      #Pongo el trabajo en estado de Admisión
      @presentacion.state_id=5
    else
      #Pongo el trabajo en estado de Evaluación
      @presentacion.state_id=1
    end
    if @presentacion.save
      flash[:notice]="El evaluador de la Presentación ha sido modificado con éxito"
    else
      flash[:notice]="El evaluador de la Presentación no pudo ser modificado, por favor intente nuevamente"
    end
    redirect_to presentations_path
    # redirect_to presentation_path(params[:id_presentacion])
  end

  def params_presentation
    params.require(:presentation).permit(:titulo,:session_id,:resumen,:trabajo,:estado)
  end
end
