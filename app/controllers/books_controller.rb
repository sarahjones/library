class BooksController < ApplicationController

  before_filter :authenticate_user!, :except => :index

  def index
    @books = Book.all
  end

  def checkout
    book = Book.find(params[:id])
    if book
      if book.available
        puts current_user.inspect
        book.update_attributes! :available => false, :checked_out_by => current_user
        puts book.reload.inspect
        flash[:success] = 'You have checked out the book'
      else
        flash[:error] = 'That book is not available'
      end
    else
      flash[:error] = 'That book does not exist'
    end

    redirect_to books_url
  end
end
