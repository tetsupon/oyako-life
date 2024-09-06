class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :child
  has_one_attached :image 
  
  belongs_to_active_hash :event_type

  with_options presence: true do
    validates :record_date
    validates :event_type_id, numericality: { other_than: 0, message: 'は0以外の値にしてください' }
    validates :description
  end
end
