class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    if User.exists?(params[:id])
      @usuario=User.find(params[:id])
      @es_participacion_centro=false;
      @puede_editar=false;
      @tiene_institucion=false;
      if @usuario.id==current_user.id or current_user.rol==2
        if @usuario.id==current_user.id
          @puede_editar=true;
        end
        @participacion=Participation.getParticipacion(@usuario.tipo_participacion);
        @nombre=@usuario.nombre
        @apellido=@usuario.apellido
        @tipo_dni=@usuario.tipo_dni
        @dni=@usuario.dni
        if(!@usuario.tipo_institucion.blank?)
          @tiene_institucion=true
          @institucion=Institution.getInstitucion(@usuario.tipo_institucion)
          @institucion_descripcion=@usuario.institucion
        end
        if(@participacion=="Centro")
            @es_participacion_centro=true
            @centro_nombre=Center.find(@usuario.centers_id).nombre
            @centro_siglas=Center.find(@usuario.centers_id).siglas
        end
        if(!@usuario.institucion.blank?)
          @descripcion_institucion=@usuario.institucion
        end
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
    if current_user.rol==4
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
