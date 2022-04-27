class PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      @photo.save_tags(params[:photo][:tags][:tag])
      redirect_to photo_path(@photo.id)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      redirect_to user_path(current_user)
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    @user = @photo.user
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      # タグの更新
      @photo.save_tags(params[:photo][:tags][:tag])
      # 成功したら投稿記事へリダイレクト
      redirect_to photo_path(@photo.id)
    else
      # 失敗した場合は、editへ戻る
      render :edit
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image, :tags)
  end

end
