require 'rails_helper'

RSpec.describe Growth, type: :model do
  before do
    @child = FactoryBot.create(:child)
    @growth = FactoryBot.build(:growth, child_id: @child.id)
  end

  describe '成長記録の保存' do
    context '保存できる場合' do
      it 'すべての必須項目が正しく入力されていれば保存できる' do
        expect(@growth).to be_valid
      end
    end

    context '保存できない場合' do
      it '記録日が空では保存できない' do
        @growth.record_date = ''
        @growth.valid?
        expect(@growth.errors.full_messages).to include("記録日を入力してください")
      end

      it '成長の種類が選択されていなければ保存できない' do
        @growth.growth_type_id = ''
        @growth.valid?
        expect(@growth.errors.full_messages).to include("成長の種類を入力してください")
      end

      it '成長の種類IDが0だと保存できない' do
        @growth.growth_type_id = 0
        @growth.valid?
        expect(@growth.errors.full_messages).to include('成長の種類は0以外の値にしてください')
      end

      it '身長が空では保存できない' do
        @growth.height = ''
        @growth.valid?
        expect(@growth.errors.full_messages).to include("身長を入力してください")
      end

      it '身長が0以下では保存できない' do
        @growth.height = 0
        @growth.valid?
        expect(@growth.errors.full_messages).to include("身長は0より大きい値にしてください")
      end

      it '体重が空では保存できない' do
        @growth.weight = ''
        @growth.valid?
        expect(@growth.errors.full_messages).to include("体重を入力してください")
      end

      it '体重が0以下では保存できない' do
        @growth.weight = 0
        @growth.valid?
        expect(@growth.errors.full_messages).to include("体重は0より大きい値にしてください")
      end
    end
  end
end
