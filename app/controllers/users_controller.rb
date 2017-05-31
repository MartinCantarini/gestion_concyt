class UsersController < ApplicationController
  def show
    @usuario=User.find(params[:id])
    if @usuario.id==current_user.id
      if @usuario.registro_completo==true
        @participacion=Participation.getParticipacion(@usuario.tipo_participacion);
        if !@usuario.tipo_beca.blank?
          @beca=Scholarship.getBeca(tipo_beca);
        else
          @beca='No posee'
        end
        @organismo=Organism.getOrganismo(@usuario.organismo);
        if @organismo=='otro'
          @organismo=@usuario.otro_organismo
        end
        @universidad=College.getUniversidad(@usuario.universidad);
        if @universidad=='otra'
          @universidad=@usuario.otra_universidad
        end
        @centro=Center.getCentro(@usuario.centro);
        if @centro=='otro'
          @centro=@usuario.otro_centro
        end
      end
    else
      redirect_to :root
    end
  end

  def index
    @usuarios=User.all
    @cantidad_usuarios=User.all.count
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
