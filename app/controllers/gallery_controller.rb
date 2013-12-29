class GalleryController < ApplicationController
  def index
    @photos = GalleryPhoto.all
  end

  def show
  end
end
