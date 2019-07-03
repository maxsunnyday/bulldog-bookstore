class OrdersController < ApplicationController
    before_action :authorized

    def index
        if params[:past]
            @orders = Order.all.select do |order|
                order.status == "done"
            end
        end
    end
    
    def new
        
    end

    def create

    end

    def show

    end

    def update
        # Use order_params or nah?
        @order = Order.find_by(user_id: session[:user_id], status: "active")
        @listing = Listing.find(params[:listing_id])
        @order.listings << @listing
        redirect_to user_path(User.find(session[:user_id]))
    end

end