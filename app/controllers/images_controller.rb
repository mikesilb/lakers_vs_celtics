class ImagesController < ApplicationController
  def create
    if !params[:game_id].nil?
      @game = Game.find(params[:game_id])
      @nbafinal = @game.nbafinal
      @image = Image.new(image_params)
      @image.game_id = @game.id
      @image.user = current_user
      if @image.save
        flash[:success] = "Your image is successfully saved!"
      else
        flash[:alert] = ''
        @image.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to game_path(@image.game_id)
    elsif !params[:player_id].nil? && params[:team_id].nil?
      @player = Player.find(params[:player_id])
      @image = Image.new(image_params)
      @image.player_id = @player.id
      @image.user = current_user
      if @image.save
        flash[:success] = "Your image is successfully saved!"
      else
        flash[:alert] = ''
        @image.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to player_path(@image.player_id)
    elsif !params[:team_id].nil?
      @team = Team.find(params[:team_id])
      @image = Image.new(image_params)
      @image.team_id = @team.id
      @image.user = current_user
      if @image.save
        flash[:success] = "Your image is successfully saved!"
      else
        flash[:alert] = ''
        @image.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to team_path(@image.team_id)
    else
      @nbafinal = Nbafinal.find(params[:nbafinal_id])
      @image = Image.new(image_params)
      @image.nbafinal_id = @nbafinal.id
      @image.user = current_user
      if @image.save
        flash[:success] = "Your image is successfully saved!"
      else
        flash[:alert] = ''
        @image.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to nbafinal_path(@nbafinal)
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if !@image.game_id.nil?
      if @image.update(image_params)
        flash[:success] = "Your image is successfully saved!"
        redirect_to game_path(@image.game_id)
      else
        flash[:errors] = @image.errors.full_messages.to_sentence
        render :edit
      end
    elsif !@image.team_id.nil?
      if @image.update(image_params)
        flash[:success] = "Your image is successfully saved!"
        redirect_to team_path(@image.team_id)
      else
        flash[:errors] = @image.errors.full_messages.to_sentence
        render :edit
      end
    else
      if @image.update(image_params)
        flash[:success] = "Your image is successfully saved!"
        redirect_to nbafinal_path(@image.nbafinal)
      else
        flash[:errors] = @image.errors.full_messages.to_sentence
        render :edit
      end
    end
  end

  def destroy
    if !Image.find(params[:id]).game_id.nil?
      @game_id = Image.find(params[:id]).game_id
      Image.find(params[:id]).destroy
      redirect_to game_path(@game_id)
    elsif !Image.find(params[:id]).team_id.nil?
      @team_id = Image.find(params[:id]).team_id
      Image.find(params[:id]).destroy
      redirect_to team_path(@team_id)
    else
      @nbafinal_id = Image.find(params[:id]).nbafinal_id
      Image.find(params[:id]).destroy
      redirect_to nbafinal_path(@nbafinal_id)
    end
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
