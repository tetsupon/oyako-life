
require 'rails_helper'

RSpec.describe Child, type: :model do
  before do
    user = FactoryBot.create(:user)
    @child = FactoryBot.build(:child, user_id: user.id)
  end

  describe '子供情報の保存' do
    context '保存できる場合' do
      it 'すべての必須項目が正しく入力されていれば保存できる' do
        expect(@child).to be_valid
      end
    end

    context '保存できない場合' do
      it 'ニックネームが空では保存できない' do
        @child.nickname = ''
        @child.valid?
        expect(@child.errors.full_messages).to include("ニックネームを入力してください")
      end

      it '名字が空では保存できない' do
        @child.family_name = ''
        @child.valid?
        expect(@child.errors.full_messages).to include("名字を入力してください")
      end

      it '名前が空では保存できない' do
        @child.first_name = ''
        @child.valid?
        expect(@child.errors.full_messages).to include("名前を入力してください")
      end

      it '名字（カナ）が空では保存できない' do
        @child.family_name_kana = ''
        @child.valid?
        expect(@child.errors.full_messages).to include("名字（カナ）を入力してください")
      end

      it '名前（カナ）が空では保存できない' do
        @child.first_name_kana = ''
        @child.valid?
        expect(@child.errors.full_messages).to include("名前（カナ）を入力してください")
      end

      it '名字（カナ）が全角カタカナ以外では保存できない' do
        @child.family_name_kana = 'たけうち'
        @child.valid?
        expect(@child.errors.full_messages).to include("名字（カナ）は有効でありません")
      end
      
      it '名前（カナ）が全角カタカナ以外では保存できない' do
        @child.first_name_kana = 'たろう'
        @child.valid?
        expect(@child.errors.full_messages).to include("名前（カナ）は有効でありません")
      end
      
      it '性別が選択されていなければ保存できない' do
        @child.gender = ''
        @child.valid?
        expect(@child.errors.full_messages).to include("性別を入力してください")
      end
      
      it '性別が「male」か「female」以外では保存できない' do
        @child.gender = 'other'
        @child.valid?
        expect(@child.errors.full_messages).to include("性別は一覧にありません")
      end

      it '生年月日が空では保存できない' do
        @child.birth_day = ''
        @child.valid?
        expect(@child.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
