class BooksController < ApplicationController

    def index 
        books= Book.order("book_author DESC").all
        render json: books
    end
end
