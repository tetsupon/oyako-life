class Event < ApplicationRecord
  belongs_to :child

  with_options presence: true do
    validates :record_date
    validates :event_type_id
    validates :description
  end
end
