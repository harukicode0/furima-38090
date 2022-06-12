require 'rails_helper'
# テスト実行のコード
# bundle exec rspec spec/models/match_buyer_address_spec.rb

RSpec.describe MatchBuyerAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      good = FactoryBot.create(:good)
      @match_buyer_address = FactoryBot.build(:match_buyer_address, user_id: user.id, good_id:good.id)
    end

    context '購入プロセスに問題ない場合' do
      it 'すべての値が入力されていれば、商品を購入できる' do
        expect(@match_buyer_address).to be_valid
      end
      it 'building_nameが空欄でも他の項目に不備がなければ、保存できること' do
        @match_buyer_address.building_name =""
        expect(@match_buyer_address).to be_valid
      end
    end

    context '購入プロセスに問題がある場合' do
      it 'nameが空だと保存できないこと' do
      end
      it 'nameが空だと保存できないこと' do
      end
    end
  end
end
