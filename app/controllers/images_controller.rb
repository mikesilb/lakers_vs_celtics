class ImagesController < ApplicationController
  def create
    @nbafinal = Nbafinal.find(params[:nbafinal_id])
    @image = Image.new(image_params)
    @image.nbafinal = @nbafinal
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

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    # @review_ratings = Review::RATINGS
    if @image.update(image_params)
      flash[:success] = "Your image is successfully saved!"
      redirect_to nbafinal_path(@image.nbafinal)
    else
      flash[:errors] = @image.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @nbafinal = Image.find(params[:id]).nbafinal
    Image.find(params[:id]).destroy
    redirect_to nbafinal_path(@nbafinal)
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end