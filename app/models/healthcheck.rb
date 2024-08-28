class Healthcheck < ApplicationRecord
  belongs_to :child

  with_options presence: true do
    validates :checkup_name
    validates :scheduled_date
    validates :doctor_name
  end
 
  # 詳細はオプションだが、最大文字数を制限
  validates :description, length: { maximum: 500 }, allow_blank: true

end
