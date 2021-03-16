class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @food = Food.new
    @foods = @shop.foods.includes(:user)
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to root_path
  end

  def update
    shop = Shop.find(params[:id])
    if shop.update(shop_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :category_id, :address, :explain, :image).merge(user_id: current_user.id)
  end
end
