class ListsController < ApplicationController

  # def index
    
  # end

  def new
    
  end

  def create
    render plain: params[:list].inspect
  end

end
