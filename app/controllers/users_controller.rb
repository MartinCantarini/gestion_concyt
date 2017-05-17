class UsersController < ApplicationController
  def show
    @usuario=User.find(params[:id])
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
