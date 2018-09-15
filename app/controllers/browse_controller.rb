class BrowseController < ApplicationController


  def index
    @dog_image_urls = DogGetters::RandomDogs.new.get
  end
end
