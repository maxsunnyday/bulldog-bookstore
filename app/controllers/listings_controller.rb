class ListingsController < ApplicationController
    before_action :authorized

    def index
        @listings = Listing.all
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