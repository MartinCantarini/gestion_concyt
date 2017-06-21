class PostersController < ApplicationController
  before_action :authenticate_user!
  require 'securerandom'

  include ActionView::Helpers::TextHelper

  def show
    if Poster.exists?(:id => params[:id])
      @poster=Poster.find(params[:id])
      @finalizado=@poster.finalizado
    else
      flash[:error]="El póster al que desea acceder no existe"
      redirect_to :root;
    end
  end

  def index
    @posters=Poster.all
  end

  def new
    #redirect_to create_poster_path
    @poster=Poster.new
  end

  def create
    # if current_user.poster_id.blank?
    #   @poster=Poster.new()
    #   @poster.save
    #   usuario=User.find(current_user.id)
    #   usuario.poster_id=@poster.id
    #   usuario.save
    #   @poster.identificador=@poster.id+100
    #   @poster.codigo=SecureRandom.urlsafe_base64(20)
    #   id_poster=@poster.id
    #   if @poster.save
    #     flash[:notice]="El poster se ha creado con Éxito"
    #   else
    #     flash[:error]="No se pudo completar la acción, por favor intente nuevamente"
    #     redirect_to :root
    #   end
    # else
    #   @poster=Poster.find(current_user.poster_id)
    # end
  @poster=Poster.new(params_poster)
   if(@poster.save)
     usuario=User.find(current_user.id)
     usuario.poster_id=@poster.id
     usuario.save
     @poster.identificador=@poster.id+100
     id_poster=@poster.id
     @poster.save
     redirect_to render_poster_path(id_poster)
   else
     redirect_to new_poster_path
   end
  end

  def edit
    @poster=Poster.find(params[:id])
  end

  def update
    @poster=Poster.find(params[:id])
    if @poster.finalizado!=true
      if(@poster.update(params_poster))
        id_poster=@poster.id
        redirect_to render_poster_path(id_poster)
      else
        redirect_to new_poster_path
      end
    else
      flash[:error]="No se pudo completar la acción, por favor intente nuevamente"
      redirect_to poster_path(@poster.id)
    end
  end

  def destroy
    @poster=Poster.find(params[:id])
    id_poster=@poster.id
    if @poster.destroy
      #Elimino el directorio que contenía al póster
      FileUtils.rm_rf('public/images/poster/'+id_poster.to_s)
      #Desvinculo al usuario que participa en el poster
      usuario_con_poster=User.where("poster_id = ?",id_poster).first
      usuario_con_poster.poster_id=nil
      usuario_con_poster.save
      flash[:notice]="El Póster ha sido eliminado con éxito"
      redirect_to :root
    else
      flash[:error]="No se pudo completar la acción, por favor intente nuevamente"
      redirect_to :root
    end
  end

  def render_poster
      @poster=Poster.find(params[:id])
      titulo=@poster.titulo
      autor=@poster.autor
      coautor1=@poster.coautor1
      coautor2=@poster.coautor2
      coautor3=@poster.coautor3
      coautor4=@poster.coautor4
      coautor5=@poster.coautor5
      institucion=@poster.institucion
      introduccion=@poster.introduccion
      objetivos=@poster.objetivos
      metodologia=@poster.metodologia
      resultados=@poster.resultados
      conclusiones=@poster.conclusiones
      finalizado=@poster.finalizado
      code=@poster.id+100
      if(@poster.formato=='1')
        img2=@poster.img2
      end
      if(@poster.formato=='1')
        img = Magick::Image.read('public/images/poster_plantillas/poster_1.jpg').first

        titulo_contenido= titulo
        titulo_contenido_wrap = word_wrap(titulo_contenido,line_width:55)

        introduccion_contenido=introduccion
        introduccion_contenido_wrap=word_wrap(introduccion_contenido,line_width:45)

        autores_titulo="Autores:"
        autores_titulo_contenido_wrap = word_wrap(autores_titulo,line_width:40)
        autor_contenido= autor
        autor_contenido_wrap = word_wrap(autor_contenido,line_width:40)

        if !coautor1.blank?
          coautor1_contenido=coautor1
          coautor1_contenido_wrap = word_wrap(coautor1_contenido,line_width:40)
        end
        if !coautor2.blank?
          coautor2_contenido= coautor2
          coautor2_contenido_wrap = word_wrap(coautor2_contenido,line_width:40)
        end
        if !coautor3.blank?
          coautor3_contenido= coautor3
          coautor3_contenido_wrap = word_wrap(coautor3_contenido,line_width:40)
        end
        if !coautor4.blank?
          coautor4_contenido= coautor4
          coautor4_contenido_wrap = word_wrap(coautor4_contenido,line_width:40)
        end
        if !coautor5.blank?
          coautor5_contenido=coautor5
          coautor5_contenido_wrap = word_wrap(coautor5_contenido,line_width:40)
        end

        institucion_titulo="Institución:"
        institucion_titulo_contenido_wrap = word_wrap(institucion_titulo,line_width:40)

        institucion_contenido=institucion
        institucion_contenido_wrap=word_wrap(institucion_contenido,line_width:45)

        objetivos_contenido=objetivos
        objetivos_contenido_wrap=word_wrap(objetivos_contenido,line_width:45)

        metodologia_contenido=metodologia
        metodologia_contenido_wrap=word_wrap(metodologia_contenido,line_width:45)

        resultados_contenido=resultados
        resultados_contenido_wrap=word_wrap(resultados_contenido,line_width:45)

        conclusiones_contenido=conclusiones
        conclusiones_contenido_wrap=word_wrap(conclusiones_contenido,line_width:45)

        titulo = Magick::Draw.new
        titulo.annotate(img, 0, 0, 0, -1150, titulo_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 70
         self.fill = 'black'
         self.gravity = Magick::CenterGravity
        end
        autores_titulo = Magick::Draw.new
        autores_titulo.annotate(img, 0, 0, 1017, 495, autores_titulo_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        autor = Magick::Draw.new
        autor.annotate(img, 0, 0, 1017, 530, autor_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 30
         self.fill = 'black'
        end
        if !coautor1.blank?
          coautor1 = Magick::Draw.new
          coautor1.annotate(img, 0, 0, 1017, 570, coautor1_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 30
           self.fill = 'black'
          end
        end
        if !coautor2.blank?
          coautor2 = Magick::Draw.new
          coautor2.annotate(img, 0, 0, 1017, 610, coautor2_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 30
           self.fill = 'black'
          end
        end
        if !coautor3.blank?
          coautor3 = Magick::Draw.new
          coautor3.annotate(img, 0, 0, 1017, 650, coautor3_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 30
           self.fill = 'black'
          end
        end
        if !coautor4.blank?
          coautor4 = Magick::Draw.new
          coautor4.annotate(img, 0, 0, 1017, 690, coautor4_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 30
           self.fill = 'black'
          end
        end
        if !coautor5.blank?
          coautor5 = Magick::Draw.new
          coautor5.annotate(img, 0, 0, 1017, 730, coautor5_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 30
           self.fill = 'black'
          end
        end
        institucion_titulo = Magick::Draw.new
        institucion_titulo.annotate(img, 0, 0, 1017, 785, institucion_titulo_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        institucion = Magick::Draw.new
        institucion.annotate(img, 0, 0, 1017, 825, institucion_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 30
         self.fill = 'black'
        end
        introduccion = Magick::Draw.new
        introduccion.annotate(img, 0, 0, 88, 620, introduccion_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        objetivos = Magick::Draw.new
        objetivos.annotate(img, 0, 0, 88, 1200, objetivos_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        metodologia = Magick::Draw.new
        metodologia.annotate(img, 0, 0, 88, 1790, metodologia_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        resultados = Magick::Draw.new
        resultados.annotate(img, 0, 0, 1000, 1762, resultados_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        conclusion = Magick::Draw.new
        conclusion.annotate(img, 0, 0, 1000, 2348,  conclusiones_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        codigo = Magick::Draw.new
        codigo.annotate(img, 0, 0, 127, 2950,  code.to_s) do
         self.font = 'Helvetica'
         self.pointsize = 70
         self.fill = 'black'
        end
        img1 = Magick::Image.read('public/images/poster/'+@poster.id.to_s+'/large/imagen1a.png').first
        img2 = Magick::Image.read('public/images/poster/'+@poster.id.to_s+'/large/imagen1b.png').first
        logo = Magick::Image.read('public/images/poster/'+@poster.id.to_s+'/large/logo.png').first
        rails_on_ruby = img.composite(img1, 1017, 955, Magick::OverCompositeOp).composite(img2, 92, 2210, Magick::OverCompositeOp).composite(logo, 1295, 45, Magick::OverCompositeOp) #the 0,0 is the x,y
        rails_on_ruby.format = 'jpeg'
      elsif (@poster.formato=='2')
        img = Magick::Image.read('public/images/poster_plantillas/poster_2.jpg').first
        titulo_contenido= titulo
        titulo_contenido_wrap = word_wrap(titulo_contenido,line_width:55)

        autores_titulo="Autores:"
        autores_titulo_contenido_wrap = word_wrap(autores_titulo,line_width:40)
        autor_contenido= autor
        autor_contenido_wrap = word_wrap(autor_contenido,line_width:40)

        if !coautor1.blank?
          coautor1_contenido=coautor1
          coautor1_contenido_wrap = word_wrap(coautor1_contenido,line_width:40)
        end
        if !coautor2.blank?
          coautor2_contenido= coautor2
          coautor2_contenido_wrap = word_wrap(coautor2_contenido,line_width:40)
        end
        if !coautor3.blank?
          coautor3_contenido= coautor3
          coautor3_contenido_wrap = word_wrap(coautor3_contenido,line_width:40)
        end
        if !coautor4.blank?
          coautor4_contenido= coautor4
          coautor4_contenido_wrap = word_wrap(coautor4_contenido,line_width:40)
        end
        if !coautor5.blank?
          coautor5_contenido=coautor5
          coautor5_contenido_wrap = word_wrap(coautor5_contenido,line_width:40)
        end

        institucion_titulo="Institución:"
        institucion_titulo_contenido_wrap = word_wrap(institucion_titulo,line_width:40)

        institucion_contenido=institucion
        institucion_contenido_wrap=word_wrap(institucion_contenido,line_width:45)

        introduccion_contenido=introduccion
        introduccion_contenido_wrap=word_wrap(introduccion_contenido,line_width:45)


        objetivos_contenido=objetivos
        objetivos_contenido_wrap=word_wrap(objetivos_contenido,line_width:45)

        metodologia_contenido=metodologia
        metodologia_contenido_wrap=word_wrap(metodologia_contenido,line_width:45)

        resultados_contenido=resultados
        resultados_contenido_wrap=word_wrap(resultados_contenido,line_width:45)

        conclusiones_contenido=conclusiones
        conclusiones_contenido_wrap=word_wrap(conclusiones_contenido,line_width:45)

        titulo = Magick::Draw.new
        titulo.annotate(img, 0, 0, 0, -1150, titulo_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 70
         self.fill = 'black'
         self.gravity = Magick::CenterGravity
        end
        autores_titulo = Magick::Draw.new
        autores_titulo.annotate(img, 0, 0, 1017, 495, autores_titulo_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 30
         self.fill = 'black'
         self.stroke_width = 4
        end
        autor = Magick::Draw.new
        autor.annotate(img, 0, 0, 1017, 525, autor_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 25
         self.fill = 'black'
        end
        if !coautor1.blank?
          coautor1 = Magick::Draw.new
          coautor1.annotate(img, 0, 0, 1017, 555, coautor1_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 25
           self.fill = 'black'
          end
        end
        if !coautor2.blank?
          coautor2 = Magick::Draw.new
          coautor2.annotate(img, 0, 0, 1017, 585, coautor2_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 25
           self.fill = 'black'
          end
        end
        if !coautor3.blank?
          coautor3 = Magick::Draw.new
          coautor3.annotate(img, 0, 0, 1017, 615, coautor3_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 25
           self.fill = 'black'
          end
        end
        if !coautor4.blank?
          coautor4 = Magick::Draw.new
          coautor4.annotate(img, 0, 0, 1017, 645, coautor4_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 25
           self.fill = 'black'
          end
        end
        if !coautor5.blank?
          coautor5 = Magick::Draw.new
          coautor5.annotate(img, 0, 0, 1017, 675, coautor5_contenido_wrap) do
           self.font = 'Helvetica'
           self.pointsize = 25
           self.fill = 'black'
          end
        end
        institucion_titulo = Magick::Draw.new
        institucion_titulo.annotate(img, 0, 0, 1017, 710, institucion_titulo_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 30
         self.fill = 'black'
        end
        institucion = Magick::Draw.new
        institucion.annotate(img, 0, 0, 1017, 740, institucion_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 25
         self.fill = 'black'
        end
        introduccion = Magick::Draw.new
        introduccion.annotate(img, 0, 0, 88, 620, introduccion_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        objetivos = Magick::Draw.new
        objetivos.annotate(img, 0, 0, 88, 1120, objetivos_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        metodologia = Magick::Draw.new
        metodologia.annotate(img, 0, 0, 88, 1600, metodologia_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        resultados = Magick::Draw.new
        resultados.annotate(img, 0, 0, 1000, 882, resultados_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        conclusion = Magick::Draw.new
        conclusion.annotate(img, 0, 0, 1000, 1498, conclusiones_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        codigo = Magick::Draw.new
        codigo.annotate(img, 0, 0, 127, 2950,  code.to_s) do
         self.font = 'Helvetica'
         self.pointsize = 70
         self.fill = 'black'
        end
        img1 = Magick::Image.read('public/images/poster/'+@poster.id.to_s+'/large/imagen2.png').first
        logo = Magick::Image.read('public/images/poster/'+@poster.id.to_s+'/large/logo.png').first
        rails_on_ruby = img.composite(img1, 382, 1995, Magick::OverCompositeOp).composite(logo, 1295, 45, Magick::OverCompositeOp) #the 0,0 is the x,y
      end
      rails_on_ruby.format = 'png'
      rails_on_ruby.write('public/images/poster/'+@poster.id.to_s+'/'+@poster.id.to_s+'.png')
      redirect_to poster_path(@poster.id)
  end
  def finalizar_poster
    @poster=Poster.find(params[:id])
    @poster.finalizado=true;
    @poster.save;
    redirect_to poster_path(@poster.id)
  end
  def params_poster
    #params.require(:poster).permit(:fuente,:formato,:titulo,:introduccion,:objetivos,:metodologia,:resultados,:conclusiones,:codigo,:finalizado,:logo,:img1a,:img1b,:img2, user_ids: [])
    params.require(:poster).permit(:identificador,:fuente,:formato,:titulo,:autor,:coautor1,:coautor2,:coautor3,:coautor4,:coautor5,:institucion,:session_id,:introduccion,:objetivos,:metodologia,:resultados,:conclusiones,:finalizado,:logo,:img1a,:img1b,:img2)
  end
end
