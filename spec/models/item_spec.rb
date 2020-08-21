require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'アイテム登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '画像は1枚必須であること'do
      image_path = Rails.root.join('public/test_image.png')
    end

    it '商品名が必須であること'do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品説明が必須であること'do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it 'カテゴリーの情報が必須であること'do
      @item.category_id = nil 
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態についての情報が必須であること'do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担についての情報が必須であること'do
      @item.postage_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end

    it '発送元の地域についての情報が必須であること'do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数についての情報が必須であること'do
      @item.delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end

    it '価格についての情報が必須であること'do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300以下では登録できないこと'do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '価格の範囲が、¥9999999以上では登録できないこと'do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end
