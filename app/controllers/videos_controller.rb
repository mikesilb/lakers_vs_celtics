class VideosController < ApplicationController
  def create
    if !params[:game_id].nil?
      @game = Game.find(params[:game_id])
      @nbafinal = @game.nbafinal
      @video = Video.new(video_params)
      @video.game_id = @game.id
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
      redirect_to nbafinal_game_path(@nbafinal, @game)
    elsif !params[:team_id].nil?
      @team = Team.find(params[:team_id])
      @nbafinal = @team.nbafinal
      @video = Video.new(video_params)
      @video.team_id = @team.id
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
      redirect_to nbafinal_team_path(@nbafinal, @team)
    else
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
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if !@video.game_id.nil?
      if @video.update(video_params)
        flash[:success] = "Your video is successfully saved!"
        redirect_to nbafinal_game_path(@video.nbafinal, @video.game_id)
      else
        flash[:errors] = @video.errors.full_messages.to_sentence
        render :edit
      end
    else
      if @video.update(video_params)
        flash[:success] = "Your video is successfully saved!"
        redirect_to nbafinal_path(@video.nbafinal)
      else
        flash[:errors] = @video.errors.full_messages.to_sentence
        render :edit
      end
    end
  end

  def destroy
    if !Video.find(params[:id]).game_id.nil?
      @nbafinal = Video.find(params[:id]).nbafinal
      @game_id = Video.find(params[:id]).game_id
      Video.find(params[:id]).destroy
      redirect_to nbafinal_game_path(@nbafinal, @game_id)
    else
      @nbafinal = Video.find(params[:id]).nbafinal
      Video.find(params[:id]).destroy
      redirect_to nbafinal_path(@nbafinal)
    end
  end


  private

  def video_params
    params.require(:video).permit(:video)
  end
end
