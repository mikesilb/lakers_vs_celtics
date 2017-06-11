class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
    @players = Player.where(team_id: @team)
    @reviews = @team.reviews
    @review = Review.new
    @image = Image.new
    @video = Video.new
    @review_ratings = Review::RATINGS
  end

  private

  def team_params_create
    params.require(:team).permit(:teamname)
  end

  def team_params_update
    params.require(:team).permit(:teamname)
  end
end
