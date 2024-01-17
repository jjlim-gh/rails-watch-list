class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    list_selector
    @bookmarks = []
    all_bookmarks = Bookmark.all
    all_bookmarks.each do |bookmark|
      if bookmark.list_id == params[:id].to_i
        @bookmarks << bookmark
      end
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def destroy
    list_selector
    list.delete
    redirect_to lists_path()
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def list_selector
    @list = List.find(params[:id])
  end
end
