class ListsController < ApplicationController
  def index
    @lists = List.all
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

  def edit
    @list = List.find(params[:id])
  end

  def update
    List.update(params[:id], list_params)
    flash[:notice] = "List Successfully Updated"
    redirect_to lists_path
  end

  def destroy
    List.destroy(params[:id])
    redirect_to :back
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end
end
