require 'rails_helper'

RSpec.describe BuysAddress, type: :model do
  describe '配送先情報' do
    before do
      @buys_address = FactoryBot.build(:buys_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@buys_address).to be_valid
    end

    it '郵便番号が空だと保存できないこと' do
      @buys_address.postal_code = nil
      @buys_address.valid?
      expect(@buys_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号は半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buys_address.postal_code = '1234567'
      @buys_address.valid?
      expect(@buys_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    
    it '都道府県を選択していないと保存できないこと' do
      @buys_address.prefecture_id = 0
      @buys_address.valid?
      expect(@buys_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都市名が空だと保存できないこと' do
      @buys_address.city = nil
      @buys_address.valid?
      expect(@buys_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと保存できないこと' do
      @buys_address.house_number = nil
      @buys_address.valid?
      expect(@buys_address.errors.full_messages).to include("House number can't be blank")
    end

    it '建物名は空でも保存できること' do
      @buys_address.building_name = nil
      expect(@buys_address).to be_valid
    end

    it '電話番号が空だと保存できないこと' do
      @buys_address.telephone_number = nil
      @buys_address.valid?
      expect(@buys_address.errors.full_messages).to include("Telephone number can't be blank") 
    end

    it '電話番号はハイフン不要で11桁以内であること' do
      @buys_address.telephone_number = '090-1111-1111'
      @buys_address.valid?
      expect(@buys_address.errors.full_messages).to include("Telephone number is telephone_number. exceeds 11 characters.")
    end
  end
end


