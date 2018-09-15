class UpvotesController < ApplicationController
  before_action :authenticate_user!, :permit_image_url

  def create
    img_url = params[:img_url]

    dog_image = DogImage.find_by(img_url: img_url)

    if dog_image.present? && dog_image.voters_include?(current_user)
      # TODO Flash message that you can't vote twice
    elsif dog_image.present?
      dog_image.upvote(user: current_user)
    else
      new_dog_image = current_user.dog_images.create(img_url: img_url)
      new_dog_image.upvote(user: current_user)
    end

    redirect_to root_path
  end

private

  def permit_image_url
    params.permit(:img_url)
  end
end
