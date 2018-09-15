class HomeController < ApplicationController


  def index
    # TODO order by vote (in JS?)
    @dog_images = get_dog_images

    respond_to do |format|
      format.html
      format.js
    end
  end

private

  def get_dog_images
    if params[:id]
      DogImage.with_votes.where('dog_images.id > ?', params[:id])
    else
      DogImage.with_votes.first(10)
    end
  end
end
