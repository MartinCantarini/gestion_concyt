class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    if User.exists?(params[:id])
      @usuario=User.find(params[:id])
      if @usuario.id==current_user.id
        @participacion=Participation.getParticipacion(@usuario.tipo_participacion);
        @nombre=@usuario.nombre
        @apellido=@usuario.apellido
        @tipo_dni=@usuario.tipo_dni
        @dni=@usuario.dni
        @institucion=Institution.getInstitucion(@usuario.tipo_institucion)
        @descripcion_institucion=@usuario.institucion
        @email=@usuario.email
        @telefono=@usuario.telefono
        @fecha_inscripcion=@usuario.created_at.strftime("%d/%m/%Y")
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
    if current_user.rol==2 or current_user.rol==3
      @usuarios=User.paginate(:page => params[:page]).order('id ASC')
      @cantidad_usuarios=User.all.count
    else
      flash[:alert]="Usted no tiene permiso para estar aquí"
      redirect_to :root
    end
  end

  def new
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
