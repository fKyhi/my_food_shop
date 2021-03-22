class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to shop_path(id: @food.shop_id)
    else
      render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    if food.update(food_params)
      redirect_to shop_path(id: food.shop_id)
    else
      render :edit
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to shop_path(id: food.shop_id)
  end

  private

  def food_params
    params.require(:food).permit(:name, :explain, :image).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
