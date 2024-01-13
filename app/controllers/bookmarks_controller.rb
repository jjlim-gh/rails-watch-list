class BookmarksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    # @movie = Movie.find(params[:movie_id])
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = params[:list_id]
    @bookmark.save
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
