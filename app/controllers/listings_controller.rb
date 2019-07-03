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
        @listing = Listing.create(listing_params)

        if @listing.valid?
            redirect_to listings_path
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
        params.require(:listing).permit(:user_id, :book_id, :order_id, :price)
    end
end