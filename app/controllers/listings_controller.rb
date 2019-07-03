class ListingsController < ApplicationController
    before_action :authorized

    def index
        # Put all this logic into the model

        if params[:search]
            books = Book.where(title: params[:search])
            if books
                @listings = []

                books.each do |book|
                    @listings << Listing.where(book_id: book.id)
                end

                @listings = @listings.flatten.select do |listing|
                    listing.order == nil
                end
            else
                @listings = []
            end
        elsif params[:sorted_p]
            @listings = Listing.all.select do |listing|
                listing.order == nil
            end.sort_by { |listing| listing.price }
        elsif params[:sorted_a]
            @listings = Listing.all.select do |listing|
                listing.order == nil
            end.sort_by { |listing| listing.book.title }
        else
            @listings = Listing.all.select do |listing|
                listing.order == nil
            end
        end
    end
    
    def new
        @listing = Listing.new
    end

    def create
        # take in the ISBN number(from the new form) and search for an existing book
        isbn = listing_params["isbn_number"]
        @book = Book.all.find_or_create_by(isbn_number: isbn)
        
        # fill in the book's attributes from google books API
        @book.update_from_google

        # create the listing
        @listing = Listing.create(listing_params)

        if @listing.valid?
            @order = Order.find_by(user_id: session[:user_id], status: "active")
            redirect_to listing_path(@listing)
        else
            flash[:error] = @listing.errors.full_messages
            render 'new'
        end
    end

    def show
        @listing = Listing.find(params[:id])
        @order = Order.find_by(user_id: session[:user_id], status: "active")
    end

    def edit
        
    end

    def update

    end

    def destroy

    end

    private
    
    def listing_params
        params.require(:listing).permit(:user_id, :isbn_number, :order_id, :price)
    end
end