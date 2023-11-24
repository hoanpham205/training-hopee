# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category_params, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @category.products.build
  end

  def show; end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    set_category_params

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @category.delete
      flash[:errors] = 'Employee Deleted Successfully'
      redirect_to category_path(@category)
    else
      flash[:errors] = @category.errors.full_messages
      redirect_to destroy_category_path
    end
  end

  private

  def set_category_params
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, products_attributes: %i[name price content])
  end
end
