class ListingsController < ApplicationController
    before_action :authorized

    def index
        # Put all this logic into the model

        if params[:search]
            books = Book.where(title: params[:search])
            if books
                @listings = []

                books.each do |book|
                    @listings << Listing.where(isbn_number: book.isbn_number)
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
        isbn_input = listing_params["isbn_number"]
        if @book = Book.find_by(isbn_number: isbn_input)
            @listing = Listing.create(listing_params)
            if @listing.valid?
                redirect_to listing_path(@listing)
            else
                flash.now[:error] = @listing.errors.full_messages
                render 'new'
            end
        else
            @book = Book.new(isbn_number: isbn_input)
            if @book.update_from_google
                # create the listing
                @listing = Listing.create(listing_params)
                if @listing.valid?
                    @book.save
                    redirect_to listing_path(@listing)
                else
                    flash.now[:error] = @listing.errors.full_messages
                    render 'new'
                end
            else
                @listing = Listing.new(listing_params)
                if @listing.valid?
                    @no_google = true
                    render 'new'
                else
                    flash.now[:error] = @listing.errors.full_messages
                    render 'new'
                end
            end
        end
    end

    def show
        @listing = Listing.find(params[:id])
        if @listing.order && @listing.order.status == "done"
            @done_order = @listing.order
        elsif User.find(session[:user_id]).listings.include?(@listing)
        else
            @order = Order.find_by(user_id: session[:user_id], status: "active")
        end
    end

    def edit
        @listing = Listing.find(params[:id])
        @book = @listing.book
    end

    def update
        @listing = Listing.find(params[:id])
        # @book = Book.find_or_create_by(isbn_number: params[:listing][:isbn_number])
        @book = @listing.book
        if @listing.update(listing_params)
            if @book.update(book_params)
                redirect_to listing_path(@listing)
            else
                flash.now[:error] = @book.errors.full_messages
                render 'edit'
            end
        else
            flash.now[:error] = @listing.errors.full_messages
            render 'edit'
        end
    end

    def destroy
        Listing.destroy(params[:id])
        redirect_to user_path(User.find(session[:user_id]))
    end

    private
    
    def listing_params
        params.require(:listing).permit(:user_id, :isbn_number, :order_id, :price)
    end

    def book_params
        params.require(:listing).require(:book).permit(:title, :author, :publisher)
    end
end