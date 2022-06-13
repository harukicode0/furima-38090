require 'rails_helper'
# テスト実行のコード
# bundle exec rspec spec/models/match_buyer_address_spec.rb

RSpec.describe MatchBuyerAddress, type: :model do
  describe '商品購入' do
    before do
      #処理が早すぎてエラーが出るため、間を置く
      sleep 0.05
      user = FactoryBot.create(:user)
      sleep 0.05
      good = FactoryBot.create(:good)
      sleep 0.05
      @match_buyer_address = FactoryBot.build(:match_buyer_address, user_id: user.id, good_id:good.id)
      sleep 0.05
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
        @match_buyer_address.address_number = "111ー1111"
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Address number は○○○-(半角ハイフン)○○○○の形で入力してください(○は数字)")
      end
      it 'address_numberが空欄の場合、購入できない' do
        @match_buyer_address.address_number = ""
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'address_numberの数字の桁数が「3桁-４桁」でない場合、購入できない' do
        @match_buyer_address.address_number = "1234-567"
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Address number は○○○-(半角ハイフン)○○○○の形で入力してください(○は数字)")
      end
      it 'prefecture_idが１の場合、購入できない' do
        @match_buyer_address.prefecture_id = 1
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが漢字・カタカナ・ひらがな以外で入力されている場合、購入できない' do
        @match_buyer_address.city = "test"
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("City は全角入力でお願いします")
      end
      it 'cityが空欄の場合、購入できない' do
        @match_buyer_address.city = ""
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空欄の場合、購入できない' do
        @match_buyer_address.banti = ""
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Banti can't be blank")
      end
      it '電話番号が空欄の場合、購入できない' do
        @match_buyer_address.phone_number = ""
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が９桁の場合、購入できない' do
        @match_buyer_address.phone_number = "123456789"
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Phone number は１０〜１１桁の数字で入力してください")
      end
      it '電話番号が12桁の場合、購入できない' do
        @match_buyer_address.phone_number = "012345678901"
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Phone number は１０〜１１桁の数字で入力してください")
      end
      it '電話番号にハイフンを含んだ場合、購入できない' do
        @match_buyer_address.phone_number = "090-1234-5678"
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Phone number は１０〜１１桁の数字で入力してください")
      end
      it 'トークンが発行されていない場合、購入できない' do
        @match_buyer_address.token = nil
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと、購入できない'do
        @match_buyer_address.user_id = nil
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'goodが紐づいていないと、購入できない'do
        @match_buyer_address.good_id = nil
        @match_buyer_address.valid?
        expect(@match_buyer_address.errors.full_messages).to include("Good can't be blank")
      end
    end
  end
end
