class FavoritesController < ApplicationController
  # before_action :set_recipe
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ
  # お気に入り登録
  def create
    @photo = Photo.find(params[:photo_id])
    if @photo.user_id != current_user.id   # 自分の投稿以外にお気に入り登録が可能
      @favorite = Favorite.create(user_id: current_user.id, photo_id: @photo.id)
      if @favorite.save
        redirect_to photo_path(@photo.id)
      end
    end
  end

  # お気に入り削除
  def destroy
    @photo = Photo.find(params[:photo_id])
    @favorite = current_user.favorites.find_by(photo_id: @photo.id)
    @favorite.destroy
    redirect_to photo_path(@photo.id)
  end
end
