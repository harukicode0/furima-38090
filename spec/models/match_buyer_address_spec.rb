require 'rails_helper'
# テスト実行のコード
# bundle exec rspec spec/models/match_buyer_address_spec.rb

RSpec.describe MatchBuyerAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      good = FactoryBot.create(:good)
      @match_buyer_address = FactoryBot.build(:match_buyer_address, user_id: user.id, good_id:good.id)
      sleep 0.1
    end

    context '購入できる場合' do
      it 'すべての値が入力されていれば、商品を購入できる' do
        expect(@match_buyer_address).to be_valid
      end
      it 'building_nameが空欄でも他の項目に不備がなければ、購入できる' do
        @match_buyer_address.building_name =""
        expect(@match_buyer_address).to be_valid
      end
      it '電話番号が10桁の場合、購入できる' do
        @match_buyer_address.phone_number = "0123456789"
        expect(@match_buyer_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'address_numberのハイフンが全角の場合、購入できない' do
      end
      it 'address_numberが空欄の場合、購入できない' do
      end
      it 'address_numberの数字の桁数が「3桁-４桁」でない場合、購入できない' do
      end
      it 'prefecture_idが１の場合、購入できない' do
      end
      it 'cityが漢字・カタカナ・ひらがな以外で入力されている場合、購入できない' do
      end
      it 'cityが空欄の場合、購入できない' do
      end
      it '番地が空欄の場合、購入できない' do
      end
      it '電話番号が空欄の場合、購入できない' do
      end
      it '電話番号が９桁の場合、購入できない' do
      end
      it '電話番号が12桁の場合、購入できない' do
      end
      it 'トークンが発行されていない場合、購入できない' do
      end
    end
  end
end
