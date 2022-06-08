require 'rails_helper'
# テスト実行のコード
# bundle exec rspec ./spec/models/user_spec.rb

RSpec.describe '新規登録', type: :models do
  before do
    @user = FactoryBot.build(:user) 
  end

  context '新規登録ができる場合' do
    it "全ての情報が入力されている時、ユーザーの新規登録ができる" do
      expect(@user).to be_valid
    end
  end
  context '新規登録ができない場合' do
      it "ニックネームが空欄では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空欄では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "既に登録されているメールアドレスでは登録できない" do
        @another_user = FactoryBot.create(:user)
        @user.email = @another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは＠を含めなければ登録できない" do
        @user.email = "tset.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが空欄では登録できない" do
        @user.password = ""
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが6文字未満では登録できない" do
        @user.password = "aaa00"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角英数字を含めないと登録できない" do
        @user.password = "aaaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "パスワードと確認用パスワードは一致しないと登録できない" do
        @user.password = "aaa000"
        @user.password_confirmation = "bbb000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

      end
      # ここから下は本人確認に間違いがあった場合、登録できないことをテストする
      it "名字の入力が欠けている場合、登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名前の入力が欠けている場合、登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名前は全角（漢字・ひらがな・カタカナ）で入力しないと登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角入力でお願いします")
      end
      it "名前カナの名字の入力が欠けている場合、登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名前カナの名前の入力のどちらかが欠けている場合、登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "名前カナは全角（カタカナ）出ないと登録できない" do
        @user.first_name_kana = "なまえ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力をお願いします")
      end
      it "生年月日が入っていない登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
  end
end


