class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    list_selector
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def list_selector
    @list = List.find(params[:id])
  end
end
