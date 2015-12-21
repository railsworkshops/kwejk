class ImagesController < ApplicationController
  include ImagesHelper
  expose(:category) { Category.find_by_default(true) }
  expose(:image, attributes: :image_params)
  expose(:random_image) { Image.order('RANDOM()').first }

  def create
    image.category = category
    image.user = current_user

    if image.save
      redirect_to oczekujace_path, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  def destroy
    image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end

  def add_to_top
    if can_add_to_top?
      image.update_attributes(category: Category.find_by_default(false))
      redirect_to top_path
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :picture)
  end
end
