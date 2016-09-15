class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @tag = Tag.find(params[:id])
  end
  def edit
    @tag = Tag.find(params[:id])
  end
  def new
    @users = User.all
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new
  end
  def create
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag Added"
      redirect_to image_path(@image)
    else
      flash[:alert] = "Unable to tab"
      render :new
    end
  end
  def update
    @tag = Tag.find(params[:id])
    @tag = @tag.update(tag_params)
    redirect_to image_path(@tag.image)
  end
  def destroy
    @tag = Tag.find(params[:id])
    if @tag.delete
      flash[:notice] = "Tag removed"
      redirect_to image_path(@tag.image)
    else
      flash[:alert] = "Unable to remove tag"
    end
  end
  private
  def tag_params
    params.require(:tag).permit(:image_id, :user_id)
  end
end
