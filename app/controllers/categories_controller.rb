class CategoriesController < ApplicationController
  before_action :authenticate_author!, only: [:create, :edit, :update, :destroy]
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Your category has been successfully saved"
      redirect_to category_path(@category)
    else
      flash[:alert] = "An error has occurred"
      render 'new'
    end
  end

  # DELETE /categories/:id
  def destroy
    if @category.destroy
      flash[:notice] = "Category correctly deleted"
      redirect_to categories_path
    else
      flash[:alert] = "An error has occurred"
      redirect_back(fallback_location: root_path)
    end
  end

  # PUT /categories/:id
  def update
    if @category.update(category_params)
      flash[:notice] = "Category correctly modified"
      redirect_to category_path(@category)
    else
      flash[:alert] = "An error has occurred"
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
