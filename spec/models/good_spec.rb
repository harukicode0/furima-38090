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
        expect(@good).to  be_valid
      end
    end
    context '商品登録ができないとき' do
      it "商品の画像がないとき、登録することができない" do
        @good.image = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Image can't be blank")
      end
      it "nameがない時、登録することができない" do
        @good.name = ""
        @good.valid?
        expect(@good.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないとき、登録することができない" do
        @good.description = ""
        @good.valid?
        expect(@good.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーの情報がないとき、登録することができない" do
        @good.category_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が登録されていない時、登録することができない" do
        @good.condition_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担情報がないとき、登録することができない" do
        @good.delivery_load_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Delivery load can't be blank")
      end
      it "発送元の地域が登録されていないとき、登録することができない" do
        @good.prefecture_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日付が登録されていないとき、登録することができない" do
        @good.delivery_day_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Delivery day can't be blank")
      end
      it "価格が空欄のとき、登録することができない" do
        @good.price = ""
        @good.valid?
        expect(@good.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が全角数字のとき、登録することができない" do
        @good.price = "３３３３"
        @good.valid?
        expect(@good.errors.full_messages).to include("Price is not a number")
      end
      it "価格が300円未満のとき、登録することができない" do
        @good.price = 200
        @good.valid?
        expect(@good.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が10,000,000以上のとき、登録することができない" do
        @good.price = 10000000
        @good.valid?
        expect(@good.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "ユーザー情報が紐づいていない時、登録することができない" do
        @good.user = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("User must exist")
      end
    end
  end
end
