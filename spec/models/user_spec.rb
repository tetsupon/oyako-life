require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it '全ての項目が入力されれば登録できる' do
        expect(@user).to be_valid
      end

      it 'パスワードが6文字以上、半角英数字混合であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end

      it '名字が全角であれば登録できる' do
        @user.family_name = '山田'
        expect(@user).to be_valid
      end

      it '名前が全角であれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end

      it '名字（カナ）が全角カナであれば登録できる' do
        @user.family_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end

      it '名前（カナ）が全角カナであれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end

      it '性別が選択されていれば登録できる' do
        @user.gender = 'male'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'メールアドレスが重複している場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'メールアドレスには@が含まれていないと登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは有効でありません')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'パスワードが5文字以下では登録できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'パスワードが英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは有効でありません')
      end

      it 'パスワードとパスワード（確認用）が不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワード（確認用）が一致しません")
      end

      it 'パスワードが数字だけだと登録できない' do
        @user.password = '11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは有効でありません')
      end

      it 'パスワードが英字だけだと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは有効でありません')
      end

      it 'パスワードが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは有効でありません')
      end

      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it '名字（全角）が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end

      it '名前（全角）が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it '名字（カナ）が空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
      end

      it '名前（カナ）が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end

      it '名字が全角でないと登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は有効でありません')
      end

      it '名前が全角でないと登録できない' do
        @user.first_name = 'rikutarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は有効でありません')
      end

      it '名字（カナ）が全角カナでないと登録できない' do
        @user.family_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カナ）は有効でありません')
      end

      it '名前（カナ）が全角カナでないと登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は有効でありません')
      end

      it '性別が空では登録できない' do
        @user.gender = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("性別を入力してください")
      end

      it '性別が無効な値では登録できない' do
        @user.gender = 'invalid_gender'
        @user.valid?
        expect(@user.errors.full_messages).to include('性別は一覧にありません')
      end


      it '生年月日が空欄だと保存できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
