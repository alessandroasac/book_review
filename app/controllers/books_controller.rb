# BooksController
class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]

  def index
    if params[:category].blank?
      @books = Book.all.order('created_at DESC')
    else
      @books = Book.by_category(params[:category])
    end
  end

  def show
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to root_url
  end

  private

    def book_params
      params.require(:book).permit(:title, :description, :author, :category_id,
                                   :book_img)
    end

    def find_book
      @book = Book.find(params[:id])
    end
end
