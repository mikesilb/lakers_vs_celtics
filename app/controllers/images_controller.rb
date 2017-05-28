class ImagesController < ApplicationController
  def create
    if !params[:game_id].nil?
      @game = Game.find(params[:game_id])
      @nbafinal = @game.nbafinal
      @image = Image.new(image_params)
      @image.game_id = @game.id
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
      redirect_to nbafinal_game_path(@nbafinal, @game)
    else
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
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if !@image.game_id.nil?
      if @image.update(image_params)
        flash[:success] = "Your image is successfully saved!"
        redirect_to nbafinal_game_path(@image.nbafinal, @image.game_id)
      else
        flash[:errors] = @image.errors.full_messages.to_sentence
        render :edit
      end
    else
      if @image.update(image_params)
        flash[:success] = "Your image is successfully saved!"
        redirect_to nbafinal_path(@image.nbafinal)
      else
        flash[:errors] = @image.errors.full_messages.to_sentence
        render :edit
      end
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
