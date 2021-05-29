class BooksController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit]
  before_action :set_group, only: [:edit, :show, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
