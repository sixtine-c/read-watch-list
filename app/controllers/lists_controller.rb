class ListsController < ApplicationController
  before_action :set_category

  def index
    @lists = List.where(category_id: @category.id)
    # @list.category_id = @category.id
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = @list.bookmarks


    if params[:query].present?
      @bookmarks = @bookmarks.joins(:item).where('items.title ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list.html', locals: { bookmarks: @bookmarks } }
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(lists_params)
    @list.category_id = @category.id

    if @list.save
      redirect_to category_lists_path(@category)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    @list.category_id = @category.id
  end

  def update
    @list = List.find(params[:id])
    @list.category_id = @category.id
    @list.update(lists_params)
    redirect_to category_list_path(@category, @list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to category_lists_path(@category)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def lists_params
    params.require(:list).permit(:name, :category_id, :photo)
  end

end
