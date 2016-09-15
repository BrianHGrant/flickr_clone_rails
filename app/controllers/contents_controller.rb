class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @content = Content.find(params[:id])
  end
  def edit
    @content = Content.find(params[:id])
  end
  def new
    @image = Image.find(params[:image_id])
    @content = @image.contents.new
  end
  def create
    @image = Image.find(params[:image_id])
    @content = @image.contents.new(content_params)
    if @content.save
      flash[:notice] = "Content Tag Added"
      redirect_to image_path(@image)
    else
      flash[:alert] = "Unable to tag"
      render :new
    end
  end
  def update
    @content = Content.find(params[:id])
    @content = @content.update(content_params)
    redirect_to image_path(@content.image)
  end
  def destroy
    @content = Content.find(params[:id])
    if @content.delete
      flash[:notice] = "Content tag removed"
      redirect_to image_path(@content.image)
    else
      flash[:alert] = "Unable to remove content tag"
    end
  end
  private
  def content_params
    params.require(:content).permit(:image_id, :name)
  end
end
