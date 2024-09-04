require 'rails_helper'

RSpec.describe Healthcheck, type: :model do
  before do
    @healthcheck = FactoryBot.build(:healthcheck)
  end

  describe '健康診断記録の保存' do
    context '健康診断記録が保存できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@healthcheck).to be_valid
      end

      it '詳細が空でも保存できる' do
        @healthcheck.description = nil
        expect(@healthcheck).to be_valid
      end

      it '詳細が500文字以内であれば保存できる' do
        @healthcheck.description = "a" * 500
        expect(@healthcheck).to be_valid
      end
    end

    context '健康診断記録が保存できない場合' do
      it '診断名が空だと保存できない' do
        @healthcheck.checkup_name = ''
        @healthcheck.valid?
        expect(@healthcheck.errors.full_messages).to include('健康診断の名前を入力してください')
      end

      it '予定日が空だと保存できない' do
        @healthcheck.scheduled_date = ''
        @healthcheck.valid?
        expect(@healthcheck.errors.full_messages).to include('予定日を入力してください')
      end

      it '医師名が空だと保存できない' do
        @healthcheck.doctor_name = ''
        @healthcheck.valid?
        expect(@healthcheck.errors.full_messages).to include('担当医師を入力してください')
      end

      it '詳細が501文字以上だと保存できない' do
        @healthcheck.description = "a" * 501
        @healthcheck.valid?
        expect(@healthcheck.errors.full_messages).to include('詳細は500文字以内で入力してください')
      end

      it '子供が紐付いていないと保存できない' do
        @healthcheck.child = nil
        @healthcheck.valid?
        expect(@healthcheck.errors.full_messages).to include('Childを入力してください')
      end
    end
  end
end
