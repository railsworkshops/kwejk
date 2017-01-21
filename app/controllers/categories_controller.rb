class CategoriesController < ApplicationController
  before_action :get_images, only: :show

  expose(:categories) { Category.all }

  expose(
    :category,
    finder: :find_by_slug,
    finder_parameter: :id,
    attributes: :category_params
  )

  def create
    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if category.save
      redirect_to category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def get_images
    category.images
  end

  def category_params
    params.require(:category).permit(:name, :slug, :default)
  end
end
