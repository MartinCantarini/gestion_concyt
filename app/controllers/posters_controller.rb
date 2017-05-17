class PostersController < ApplicationController

  include ActionView::Helpers::TextHelper
  
  def show
    @poster=Poster.find(params[:id])
    @finalizado=@poster.finalizado
  end

  def index
    @posters=Poster.all
  end

  def new
    @poster=Poster.new
  end

  def create
    @poster=Poster.new(params_poster)
    id_usuario=current_user.id
    @poster.user_id=id_usuario
    if(@poster.save)
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
    if(@poster.update(params_poster))
      id_poster=@poster.id
      redirect_to render_poster_path(id_poster)
    else
      redirect_to new_poster_path
    end  
  end

  def destroy
  end
  
  def render_poster
      @poster=Poster.find(params[:id])
      titulo=@poster.titulo
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
        resultados.annotate(img, 0, 0, 1000, 1780, resultados_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        conclusion = Magick::Draw.new
        conclusion.annotate(img, 0, 0, 1000, 2350,  conclusiones_contenido_wrap) do
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
        metodologia.annotate(img, 0, 0, 88, 1610, metodologia_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        resultados = Magick::Draw.new
        resultados.annotate(img, 0, 0, 1000, 900, resultados_contenido_wrap) do
         self.font = 'Helvetica'
         self.pointsize = 40
         self.fill = 'black'
        end
        conclusion = Magick::Draw.new
        conclusion.annotate(img, 0, 0, 1000, 1500, conclusiones_contenido_wrap) do
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
    binding.pry
    @poster.save;
    redirect_to poster_path(@poster.id)
  end
  def params_poster
    params.require(:poster).permit(:fuente,:formato,:titulo,:introduccion,:objetivos,:metodologia,:resultados,:conclusiones,:logo,:img1a,:img1b,:img2,:codigo,:finalizado)
  end 
end
