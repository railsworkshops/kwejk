class CategoriesController < ApplicationController
  expose(:category, finder: :find_by_slug, finder_parameter: :slug, attributes: :category_params)
  expose(:categories)
  expose(:images) { category.images }

  def create
    if category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if category.save
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :slug, :default)
  end
end
