# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
