class BookmarksController < ApplicationController
  before_action :set_category
  before_action :set_list

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @bookmark.list_id = @list.id

    if @bookmark.save!
      redirect_to category_list_path(@category, @list)
    else
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @list.category_id = @category.id
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.list_id = @list.id
    @bookmark.update(bookmarks_params)
    redirect_to category_list_path(@category, @list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to category_list_path(@category, @list)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :item_id)
  end
end
