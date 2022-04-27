class HomesController < ApplicationController
  before_action :authenticate_user!
  def top
   @photos = Photo.all.order(created_at: :desc)
  end
end
