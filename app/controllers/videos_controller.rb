class VideosController < ApplicationController
  def create
    @nbafinal = Nbafinal.find(params[:nbafinal_id])
    @video = Video.new(video_params)
    @video.nbafinal = @nbafinal
    @video.user = current_user
    if @video.save
      flash[:success] = "Your video is successfully saved!"
    else
      flash[:alert] = ''
      @video.errors.full_messages.each do |m|
        flash[:alert] += m
      end
    end
    redirect_to nbafinal_path(@nbafinal)
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    # @video_ratings = Video::RATINGS
    if @video.update(video_params)
      flash[:success] = "Your video is successfully saved!"
      redirect_to nbafinal_path(@video.nbafinal)
    else
      flash[:errors] = @video.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @nbafinal = Video.find(params[:id]).nbafinal
    Video.find(params[:id]).destroy
    redirect_to nbafinal_path(@nbafinal)
  end

  private

  def video_params
    params.require(:video).permit(:video)
  end
end