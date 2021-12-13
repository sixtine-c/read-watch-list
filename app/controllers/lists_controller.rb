class ListsController < ApplicationController
  def index
    @lists = List.all
    @category = Category.find(params[:category_id])
  end

  def show
    @list = List.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def new
    @list = List.new
    @category = Category.find(params[:category_id])
  end

  def create
    @list = List.new(lists_params)
    @category = Category.find(params[:category_id])
    @list.category_id = @category.id

    if @list.save
      redirect_to category_lists_path(@category)
    else
      render :new
    end

  end

  private

  def lists_params
    params.require(:list).permit(:name, :category_id)
  end
end
