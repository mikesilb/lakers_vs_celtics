class ReviewsController < ApplicationController
  def create
    if !params[:game_id].nil?
      @game = Game.find(params[:game_id])
      @review = Review.new(review_params)
      @review.game_id = @game.id
      @review.user = current_user
      if @review.save
        flash[:success] = "Your review is successfully saved!"
      else
        flash[:alert] = ''
        @review.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to game_path(@review.game_id)
    elsif !params[:player_id].nil?
      @player = Player.find(params[:player_id])
      @review = Review.new(review_params)
      @review.player_id = @player.id
      @review.user = current_user
      if @review.save
        flash[:success] = "Your review is successfully saved!"
      else
        flash[:alert] = ''
        @review.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to player_path(@review.player_id)
    elsif !params[:team_id].nil? && params[:player_id].nil?
      @team = Team.find(params[:team_id])
      @review = Review.new(review_params)
      @review.team_id = @team.id
      @review.user = current_user
      if @review.save
        flash[:success] = "Your review is successfully saved!"
      else
        flash[:alert] = ''
        @review.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to team_path(@review.team_id)
    else
      @nbafinal = Nbafinal.find(params[:nbafinal_id])
      @review = Review.new(review_params)
      @review.nbafinal_id = @nbafinal.id
      @review.user = current_user
      if @review.save
        flash[:success] = "Your review is successfully saved!"
      else
        flash[:alert] = ''
        @review.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to nbafinal_path(@nbafinal)
    end
  end

  def edit
    @review = Review.find(params[:id])
    @review_ratings = Review::RATINGS
  end

  def update
    @review = Review.find(params[:id])
    @review_ratings = Review::RATINGS
    if !@review.game_id.nil?
      if @review.update(review_params)
        flash[:success] = "Your review is successfully saved!"
        redirect_to game_path(@review.game_id)
      else
        flash[:errors] = @review.errors.full_messages.to_sentence
        render :edit
      end
    elsif !@review.player_id.nil?
      if @review.update(review_params)
        flash[:success] = "Your review is successfully saved!"
        redirect_to player_path(@review.player_id)
      else
        flash[:errors] = @review.errors.full_messages.to_sentence
        render :edit
      end
    elsif !@review.team_id.nil? && @review.player_id.nil?
      if @review.update(review_params)
        flash[:success] = "Your review is successfully saved!"
        redirect_to team_path(@review.team_id)
      else
        flash[:errors] = @review.errors.full_messages.to_sentence
        render :edit
      end
    else
      if @review.update(review_params)
        flash[:success] = "Your review is successfully saved!"
        redirect_to nbafinal_path(@review.nbafinal_id)
      else
        flash[:errors] = @review.errors.full_messages.to_sentence
        render :edit
      end
    end
  end

  def destroy
    if !Review.find(params[:id]).game_id.nil?
      @game_id = Review.find(params[:id]).game_id
      Review.find(params[:id]).destroy
      redirect_to game_path(@game_id)
    elsif !Review.find(params[:id]).team_id.nil?
      @team_id = Review.find(params[:id]).team_id
      Review.find(params[:id]).destroy
      redirect_to team_path(@team_id)
    elsif !Review.find(params[:id]).player_id.nil?
      @player_id = Review.find(params[:id]).player_id
      Review.find(params[:id]).destroy
      redirect_to player_path(@player_id)
    else
      @nbafinal_id = Review.find(params[:id]).nbafinal_id
      Review.find(params[:id]).destroy
      redirect_to nbafinal_path(@nbafinal_id)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
