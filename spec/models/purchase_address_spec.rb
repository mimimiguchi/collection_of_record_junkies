require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      collection = FactoryBot.create(:collection_sell)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, collection_id: collection.id)
      sleep 0.1 #テストで過負荷対策
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingが空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
      end

      it 'postcodeが空だと保存できないこと' do
        @purchase_address.postcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号を例のように入力してください (例 123-4567)")
      end

      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を例のように入力してください (例 123-4567)")
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を選択してください")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'blockが空だと保存できないこと' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください", "電話番号を10桁以上で入力してください", "電話番号を半角数字で入力してください")
      end

      it 'phone_numberが9桁以下だと保存できないこと' do
        @purchase_address.phone_number = '080123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を10桁以上で入力してください")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @purchase_address.phone_number = '080123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を11桁以下で入力してください")
      end

      it 'phone_numberが全角数字だと保存できないこと' do
        @purchase_address.phone_number = '０８０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を半角数字で入力してください")
      end

      it 'userが紐ついていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end

      it 'collectionが紐ついていないと保存できないこと' do
        @purchase_address.collection_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Collectionを入力してください")
      end
    end
  end
end
