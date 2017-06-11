class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
    @reviews = @player.reviews
    @review = Review.new
    @image = Image.new
    @video = Video.new
    @review_ratings = Review::RATINGS
  end

  private

  def team_params_create
    params.require(:player).permit(:lastname, :firstname)
  end

  def team_params_update
    params.require(:player).permit(:teamname, :firstname)
  end
end
