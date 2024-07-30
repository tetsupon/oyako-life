class Growth < ApplicationRecord
  belongs_to :child
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :growth_type

  with_options presence: true do
    validates :record_date
    validates :growth_type_id
    validates :height, numericality: { greater_than: 0 }
    validates :weight, numericality: { greater_than: 0 }
  end
end
