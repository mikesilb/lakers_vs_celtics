class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews
    @review = Review.new
    @image = Image.new
    @video = Video.new
    @review_ratings = Review::RATINGS
  end

  private

  def game_params_create
    params.require(:game).permit(:date, :score)
  end

  def game_params_update
    params.require(:game).permit(:date, :score)
  end
end
