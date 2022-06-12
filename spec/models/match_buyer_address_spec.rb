require 'rails_helper'

RSpec.describe MatchBuyerAddress, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'nameが空だと保存できないこと' do
      end
      it 'nameが全角日本語でないと保存できないこと' do
      end
      it 'name_readingが空だと保存できないこと' do
      end
      it 'name_readingが全角カタカナでないと保存できないこと' do
      end
      it 'nicknameが空だと保存できないこと' do
      end
      it 'nicknameが半角でないと保存できないこと' do
      end
    end
  end
end
