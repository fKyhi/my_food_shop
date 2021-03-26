require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '#create' do
    before do
      @shop = FactoryBot.build(:shop)
    end

    context '新規投稿できる時' do
      it 'image,name,category_id,explain,addressが存在する時保存できる' do
        expect(@shop).to be_valid
      end
    end

    context '新規投稿できない時' do
      it 'nameが空だと保存できない' do
        @shop.name = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include "shop名を入力してください"
      end
      it 'category_idが「--」だと保存できない' do
        @shop.category_id = 1
        @shop.valid?
        expect(@shop.errors.full_messages).to include 'カテゴリーは「--」以外を選択してください'
      end
      it 'addressが空だと保存できない' do
        @shop.address = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include "住所を入力してください"
      end
      it 'explainが空だと保存できない' do
        @shop.explain = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include "shop情報を入力してください"
      end
      it 'imageが空だと保存できない' do
        @shop.image = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include "画像を入力してください"
      end
    end
  end
end
