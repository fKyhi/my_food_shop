require 'rails_helper'

RSpec.describe Food, type: :model do
  describe '#create' do
    before do
      @food = FactoryBot.build(:food)
    end

    context '新規投稿できる時' do
      it 'image,name,explainが存在する場合保存できる' do
        expect(@food).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'imageが空だと保存できない' do
        @food.image = nil
        @food.valid?
        expect(@food.errors.full_messages).to include "画像を入力してください"
      end
      it 'nameが空だと保存できない' do
        @food.name = ' '
        @food.valid?
        expect(@food.errors.full_messages).to include "food名を入力してください"
      end
      it 'explainが空だと保存できない' do
        @food.explain = ' '
        @food.valid?
        expect(@food.errors.full_messages).to include "food情報を入力してください"
      end
    end
  end
end
