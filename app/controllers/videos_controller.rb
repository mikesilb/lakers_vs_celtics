class VideosController < ApplicationController
  def create
    if !params[:game_id].nil?
      @game = Game.find(params[:game_id])
      @nbafinal = @game.nbafinal
      @video = Video.new(video_params)
      @video.game_id = @game.id
      @video.user = current_user
      if @video.save
        flash[:success] = "Your video is successfully saved!"
      else
        flash[:alert] = ''
        @video.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to game_path(@video.game_id)
    elsif !params[:team_id].nil?
      @team = Team.find(params[:team_id])
      @video = Video.new(video_params)
      @video.team_id = @team.id
      @video.user = current_user
      if @video.save
        flash[:success] = "Your video is successfully saved!"
      else
        flash[:alert] = ''
        @video.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to team_path(@video.team_id)
    elsif !params[:player_id].nil? && params[:team_id].nil?
      @player = Player.find(params[:player_id])
      @video = Video.new(video_params)
      @video.player_id = @player.id
      @video.user = current_user
      if @video.save
        flash[:success] = "Your video is successfully saved!"
      else
        flash[:alert] = ''
        @video.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to player_path(@video.player_id)
    else
      @nbafinal = Nbafinal.find(params[:nbafinal_id])
      @video = Video.new(video_params)
      @video.nbafinal_id = @nbafinal.id
      @video.user = current_user
      if @video.save
        flash[:success] = "Your video is successfully saved!"
      else
        flash[:alert] = ''
        @video.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to nbafinal_path(@video.nbafinal_id)
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
        redirect_to game_path(@video.game_id)
      else
        flash[:errors] = @video.errors.full_messages.to_sentence
        render :edit
      end
    elsif !@video.team_id.nil?
      if @video.update(video_params)
        flash[:success] = "Your video is successfully saved!"
        redirect_to team_path(@video.team_id)
      else
        flash[:errors] = @video.errors.full_messages.to_sentence
        render :edit
      end
    elsif !@video.player_id.nil?
      if @video.update(video_params)
        flash[:success] = "Your video is successfully saved!"
        redirect_to player_path(@video.player_id)
      else
        flash[:errors] = @video.errors.full_messages.to_sentence
        render :edit
      end
    else
      if @video.update(video_params)
        flash[:success] = "Your video is successfully saved!"
        redirect_to nbafinal_path(@video.nbafinal_id)
      else
        flash[:errors] = @video.errors.full_messages.to_sentence
        render :edit
      end
    end
  end

  def destroy
    if !Video.find(params[:id]).game_id.nil?
      @game_id = Video.find(params[:id]).game_id
      Video.find(params[:id]).destroy
      redirect_to game_path(@game_id)
    elsif !Video.find(params[:id]).team_id.nil?
      @team_id = Video.find(params[:id]).team_id
      Video.find(params[:id]).destroy
      redirect_to team_path(@team_id)
    else
      @nbafinal_id = Video.find(params[:id]).nbafinal_id
      Video.find(params[:id]).destroy
      redirect_to nbafinal_path(@nbafinal_id)
    end
  end


  private

  def video_params
    params.require(:video).permit(:video)
  end
end
