class NbafinalsController < ApplicationController
  def index
    @nbafinals = Nbafinal.all
    @users = User.all
  end

  def show
    @nbafinal = Nbafinal.find_by(id: params[:id])
    @reviews = @nbafinal.reviews
    @games = Game.where(nbafinal_id: @nbafinal)
    @teams = Team.where(nbafinal_id: @nbafinal)
    # @search_colors = Color.search(params[:query])
    @review = Review.new
    @image = Image.new
    @video = Video.new
    @review_ratings = Review::RATINGS
  end

  def new
    @nbafinal = Nbafinal.new
  end

  def create
    @nbafinal = Nbafinal.new(nbafinal_params_create)
    # @color.hex_code = @color.hex_code.upcase
    # @color.user = current_user
    if @nbafinal.save
      flash[:success] = "Finals added successfully"
      redirect_to nbafinal_path(@nbafinal)
    else
      flash[:errors] = @nbafinal.errors.full_messages.to_sentence
      render :new
    end
  end
  #
  # def edit
  #   @color = Color.find(params[:id])
  # end
  #
  # def update
  #   @color = Color.find(params[:id])
  #   @color.user = current_user
  #   if @color.update(color_params_update)
  #     flash[:success] = "Color updated successfully"
  #     redirect_to color_path(@color)
  #   else
  #     flash[:errors] = @color.errors.full_messages.to_sentence
  #     render :new
  #   end
  # end

  private

  def nbafinal_params_create
    params.require(:nbafinal).permit(:year, :numgames, :champion, :mvp)
  end

  def nbafinal_params_update
    params.require(:nbafinal).permit(:year, :numgames, :champion, :mvp)
  end
end
