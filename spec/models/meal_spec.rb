require 'rails_helper'

RSpec.describe Meal, type: :model do
  before do
    @meal = FactoryBot.build(:meal)
  end

  describe '食事記録の保存' do
    context '食事記録が保存できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@meal).to be_valid
      end
    end

    context '食事記録が保存できない場合' do
      it '食事の日付が空だと保存できない' do
        @meal.meal_date = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include('食事の日付・時間を入力してください')
      end

      it '食事の種類IDが空だと保存できない' do
        @meal.meal_type_id = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include('食事の種類を入力してください')
      end

      it '食事の種類IDが0だと保存できない' do
        @meal.meal_type_id = 0
        @meal.valid?
        expect(@meal.errors.full_messages).to include('食事の種類は0以外の値にしてください')
      end

      it '食事名が空だと保存できない' do
        @meal.meal_name = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include('食品名を入力してください')
      end

      it '子供が紐付いていないと保存できない' do
        @meal.child = nil
        @meal.valid?
        expect(@meal.errors.full_messages).to include('Childを入力してください')
      end
    end
  end
end
