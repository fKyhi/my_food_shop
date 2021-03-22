class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]
  before_action :set_food, only: [:edit, :update, :destroy]

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
  end

  def update
    if @food.update(food_params)
      redirect_to shop_path(id: food.shop_id)
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to shop_path(id: food.shop_id)
  end

  private

  def food_params
    params.require(:food).permit(:name, :explain, :image).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

def move_to_root_path
  food = Food.find(params[:id])
  unless user_signed_in? && current_user.id == food.user_id
    redirect_to root_path
  end
end

def set_food
  @food = Food.find(params[:id])
end

end
