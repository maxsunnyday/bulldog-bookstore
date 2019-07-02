class BooksController < ApplicationController
    before_action :authorized

    def index

    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.create(book_params)

        if @book.valid?
            redirect_to book_path(@book)
        else
            flash[:error] = @book.errors.full_messages
            render 'new'
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    private
    
    def book_params
        params.require(:book).permit(:title, :author, :isbn_number)
    end
end