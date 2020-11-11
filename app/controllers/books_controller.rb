class BooksController < ApplicationController

    def index 
        books= Book.all.sort{ |a, b| a <=> b }
        render json: books
    end
end
