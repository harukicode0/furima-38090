require 'rails_helper'
#実行コード
#bundle exec rspec spec/models/good_spec.rb

RSpec.describe Good, type: :model do
  before do
    @good = FactoryBot.build(:good)
  end
  describe '商品登録' do
    context '商品登録できる時' do
      it "全ての情報が入力されている時、商品登録可能" do

      end
    end
    context '商品登録ができないとき' do
      it "商品の画像がないとき、登録することができない" do

      end
      it "nameがない時、登録することができない" do

      end
      it "商品の説明がないとき、登録することができない" do

      end
      it "カテゴリーの情報がないとき、登録することができない" do

      end
      it "商品の状態が登録されていない時、登録することができない" do

      end
      it "配送料の負担情報がないとき、登録することができない" do

      end
      it "発送元の地域が登録されていないとき、登録することができない" do

      end
      it "発送までの日付が登録されていないとき、登録することができない" do

      end
      it "価格が空欄のとき、登録することができない" do

      end
      it "価格が全角数字のとき、登録することができない" do

      end
      it "価格が300円未満のとき、登録することができない" do

      end
      it "価格が10,000,000以上のとき、登録することができない" do

      end
    end
  end
end
