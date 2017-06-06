class ReviewsController < ApplicationController
  def create
    if !params[:game_id].nil?
      @game = Game.find(params[:game_id])
      @nbafinal = @game.nbafinal
      @review = Review.new(review_params)
      @review.game_id = @game.id
      @review.nbafinal = @nbafinal
      @review.user = current_user
      if @review.save
        flash[:success] = "Your review is successfully saved!"
      else
        flash[:alert] = ''
        @review.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to nbafinal_game_path(@nbafinal, @game)
    elsif !params[:team_id].nil?
      @team = Team.find(params[:team_id])
      @nbafinal = @team.nbafinal
      @review = Review.new(review_params)
      @review.team_id = @team.id
      @review.nbafinal = @nbafinal
      @review.user = current_user
      if @review.save
        flash[:success] = "Your review is successfully saved!"
      else
        flash[:alert] = ''
        @review.errors.full_messages.each do |m|
          flash[:alert] += m
        end
      end
      redirect_to nbafinal_team_path(@nbafinal, @team)
    else
      @nbafinal = Nbafinal.find(params[:nbafinal_id])
      @review = Review.new(review_params)
      @review.nbafinal = @nbafinal
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
        redirect_to nbafinal_game_path(@review.nbafinal, @review.game_id)
      else
        flash[:errors] = @review.errors.full_messages.to_sentence
        render :edit
      end
    else
      if @review.update(review_params)
        flash[:success] = "Your review is successfully saved!"
        redirect_to nbafinal_path(@review.nbafinal)
      else
        flash[:errors] = @review.errors.full_messages.to_sentence
        render :edit
      end
    end
  end

  def destroy
    if !Review.find(params[:id]).game_id.nil?
      @nbafinal = Review.find(params[:id]).nbafinal
      @game_id = Review.find(params[:id]).game_id
      Review.find(params[:id]).destroy
      redirect_to nbafinal_game_path(@nbafinal, @game_id)
    else
      @nbafinal = Review.find(params[:id]).nbafinal
      Review.find(params[:id]).destroy
      redirect_to nbafinal_path(@nbafinal)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
