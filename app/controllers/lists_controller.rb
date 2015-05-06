class ListsController < ApplicationController
  def index
    @lists = List.unarchived
  end

  def show
    @list = List.find(params[:id])
  end

  def new
  end

  def create
    list = List.new(list_params)
    if list.save
      respond_to do |format|
        format.html { flash[:notice] = "List successfully created"; redirect_to lists_path }
        format.js
      end
    else
      flash[:notice] = "We're sorry, something went wrong"
      redirect_to :back
    end
  end


  private

  def list_params
    params.require(:list).permit(:title)
  end
end
