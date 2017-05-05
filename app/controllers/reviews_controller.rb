class ReviewsController < ApplicationController

  def create
    @nbafinal = Nbafinal.find(params[:nbafinal_id])
    @review = Review.new(review_params)
    @review.nbafinal = @nbafinal
    @review.user = current_user
    if @review.save
      flash[:success] = "Your review is successfully saved!"
      redirect_to nbafinal_path(@nbafinal)
    else
      flash[:alert] = ''
      @review.errors.full_messages.each do |m|
        flash[:alert] += m
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
    Review.find(params[:id]).destroy
    redirect_to nbafinal_path(@nbafinal)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
