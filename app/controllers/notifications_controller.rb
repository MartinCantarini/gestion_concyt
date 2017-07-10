class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def show
    if current_user.rol==2 or current_user.rol==3
      @notificacion=Notification.find(params[:id])
      if @notificacion.leido = 0
        @notificacion.leido = @notificacion.leido + 1
        @notificacion.save
      end
      if(@notificacion.para_administrador)
        redirect_to presentation_path(@notificacion.presentation_id)
      end
    else
      flash[:alert]="Usted no tiene permiso para estar aquí"
      redirect_to :root
    end
  end

  def index
    if current_user.rol==2 or current_user.rol==3
      user_id=current_user.id
      @notificaciones_para_organizador=Notification.where("para_administrador = 1").paginate(:page => params[:page]).order('created_at DESC')
    else
      flash[:alert]="Usted no tiene permiso para estar aquí"
      redirect_to :root
    end
  end

  def new
    if Notification.create(cuerpo:params[:cuerpo],para_administrador:false,presentation_id:params[:presentation_id])
      flash[:notice]="Corrección enviada con éxito"
      redirect_to presentation_path(params[:presentation_id])
    else
      flash[:alert]="La corrección no pudo ser enviada, por favor intente nuevamente"
      redirect_to presentation_path(params[:presentation_id])
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
