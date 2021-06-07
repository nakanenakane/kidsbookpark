class BooksController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit, :sell]
  #before_action :set_group, only: [:edit, :show, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @book.item_images.new
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      @book.item_images.new
      render :new
    end
  end


  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  # def set_group
  #   @book = Book.find(params[:id])
  # end

  def book_params
    params.require(:book).permit(:name, :price, :introduction, :category_id, :publisher_id, :author, :condition_id, :preparation_day_id, :postage_payer_id, :prefecture_id, item_images_attributes: [:image, :id, :_destroy]).merge(user_id: current_user.id)
  end

end
