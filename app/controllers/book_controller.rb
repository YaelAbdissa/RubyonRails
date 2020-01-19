class BookController < ApplicationController

    def index
       @book = Book.all
    end

    def new
        @book = Book.new
    
    end

    def create
      @book = Book.new(book_param)
      #render json: @book
      if @book.save
          flash[:notice] = "Added successfully!!"
          redirect_to action:"list"
      else
          flash[:notice] = "Adding new book failed!"
          render action:"new"
      end
  end

  private
  def book_param
      params.require(:book).permit(:title, :description, :price,DEFAULT)
  end

  def edit

  end
 
 end