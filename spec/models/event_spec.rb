require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe '出来事記録の保存' do
    context '出来事記録が保存できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@event).to be_valid
      end

      it '画像がなくても保存できる' do
        @event.image = nil
        expect(@event).to be_valid
      end
    end

    context '出来事記録が保存できない場合' do
      it '日付が空だと保存できない' do
        @event.record_date = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('出来事の日付を入力してください')
      end

      it '出来事の種類が空だと保存できない' do
        @event.event_type_id = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('出来事の種類を入力してください')
      end

      it '出来事の種類IDが0だと保存できない' do
        @event.event_type_id = 0
        @event.valid?
        expect(@event.errors.full_messages).to include('出来事の種類は0以外の値にしてください')
      end

      it '詳細説明が空だと保存できない' do
        @event.description = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('詳細説明を入力してください')
      end
    end
  end
end
