class HomesController < ApplicationController
  before_action :authenticate_user!
  def top
   @photos = Photo.all
  end
end
