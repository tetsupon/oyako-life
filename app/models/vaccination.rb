class Vaccination < ApplicationRecord
  belongs_to :child

  with_options presence: true do
    validates :vaccination_name
    validates :scheduled_date
    validates :administered_date
  end
end
