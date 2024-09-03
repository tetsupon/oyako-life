require 'rails_helper'

RSpec.describe Vaccination, type: :model do
  before do
    @vaccination = FactoryBot.build(:vaccination)
  end

  describe '予防接種記録の保存' do
    context '予防接種記録が保存できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@vaccination).to be_valid
      end
    end

    context '予防接種記録が保存できない場合' do
      it '予防接種名が空だと保存できない' do
        @vaccination.vaccination_name = ''
        @vaccination.valid?
        expect(@vaccination.errors.full_messages).to include('予防接種の名前を入力してください')
      end

      it '予定日が空だと保存できない' do
        @vaccination.scheduled_date = ''
        @vaccination.valid?
        expect(@vaccination.errors.full_messages).to include('接種予定日を入力してください')
      end

      it '接種日が空だと保存できない' do
        @vaccination.administered_date = ''
        @vaccination.valid?
        expect(@vaccination.errors.full_messages).to include('接種実施日を入力してください')
      end
    end
  end
end


