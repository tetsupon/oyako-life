class Child < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    # ニックネームのバリデーション
    validates :nickname

    # 名前のバリデーション
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }  

    # 名前（カナ）のバリデーション
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }    

    # 性別のバリデーション
    validates :gender, inclusion: { in: ['male', 'female'] }

    # 生年月日のバリデーション
    validates :birth_day
    
  end
end
