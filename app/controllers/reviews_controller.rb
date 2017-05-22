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
    # @review_ratings = Review::RATINGS
    if @review.update(review_params)
      flash[:success] = "Your review is successfully saved!"
      redirect_to nbafinal_path(@review.nbafinal)
    else
      flash[:errors] = @review.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @nbafinal = Review.find(params[:id]).nbafinal
  #  @game = Review.find(params[:id]).game
    Review.find(params[:id]).destroy
    redirect_to nbafinal_path(@nbafinal)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
