class BookmarksController < ApplicationController
  before_action :set_category
  before_action :set_list

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to category_list_path(@category, @list)
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmarks_params
    params.require(:list).permit(:name, :category_id, :photo)
  end
end
