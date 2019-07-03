class OrdersController < ApplicationController
    before_action :authorized

    def index
        @orders = Order.all.select do |order|
            order.user_id == session[:user_id]
        end.select do |order|
            order.status == "done"
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
        if params[:add]
            @listing = Listing.find(params[:listing_id])
            @order = Order.find_by(user_id: session[:user_id], status: "active")
            @order.listings << @listing
            redirect_to user_path(User.find(session[:user_id]))
        elsif params[:remove]
            @listing = Listing.find(params[:listing_id])
            @listing.order = nil
            @listing.save
            redirect_to user_path(User.find(session[:user_id]))
        end
    end

    def checkout
        order = Order.find_by(user_id: session[:user_id], status: "active")
        if order.listings == []
            redirect_to user_path(User.find(session[:user_id]))
        else
            order.update(user_id: session[:user_id], status: "done")
            Order.find_or_create_by(user_id: session[:user_id], status: "active")
            redirect_to orders_path
        end
    end

end