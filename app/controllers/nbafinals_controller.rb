class NbafinalsController < ApplicationController
  def index
    # # @search_colors = Color.search(params[:query]).order('created_at DESC')
    # # @rand_color = @search_colors.sample
    # # @text_color = text_color(@rand_color.hex_code)
    # if user_signed_in?
    #   @recent_reviews = current_user.reviews.order('created_at DESC').limit(5)
    # else
    #   @recent_reviews = []
    # end

    @nbafinals = Nbafinal.all
    @users = User.all
  end

  def show
    @nbafinal = Nbafinal.find(params[:id])
    # @search_colors = Color.search(params[:query])
    # @review = Review.new
    # @review_ratings = Review::RATINGS
    # @text_color = text_color(@color.hex_code)
  end
  #
  # def new
  #   @color = Color.new
  # end
  #
  # def create
  #   @color = Color.new(color_params_create)
  #   @color.hex_code = @color.hex_code.upcase
  #   @color.user = current_user
  #
  #   if @color.save
  #     flash[:success] = "Color added successfully"
  #     redirect_to color_path(@color)
  #   else
  #     flash[:errors] = @color.errors.full_messages.to_sentence
  #     render :new
  #   end
  # end
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
  #
  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    redirect_to colors_path
  end

  def data
    @colors = Color.all
    render json: @colors
  end

  private

  def color_params_create
    params.require(:color).permit(:hex_code, :nickname)
  end

  def color_params_update
    params.require(:color).permit(:nickname)
  end

end
