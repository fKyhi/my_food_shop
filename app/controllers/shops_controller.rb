class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :move_to_index, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

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
    @food = Food.new
    @foods = @shop.foods.includes(:user)
  end

  def edit
  end

  def destroy
    @shop.destroy
    redirect_to root_path
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path
    else
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :category_id, :address, :explain, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    shop = Shop.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == shop.user_id
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
