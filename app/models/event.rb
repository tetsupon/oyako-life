class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :child
  has_many_attached :images  # 複数の画像を添付する場合
  
  belongs_to_active_hash :event_type

  with_options presence: true do
    validates :record_date
    validates :event_type_id
    validates :description
  end
end
