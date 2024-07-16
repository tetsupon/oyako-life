class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable   


  has_many :childrens

  with_options presence: true do
    # ニックネームのバリデーション
    validates :nickname

    # 名前のバリデーション
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角文字で入力してください" }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角文字で入力してください" }

    # 名前（カナ）のバリデーション
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください" }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください" }

    # 性別のバリデーション
    validates :gender, inclusion: { in: ['male', 'female'], message: "男性か女性を選択してください" }

    # 生年月日のバリデーション
    validates :birth_day

    # Emailのバリデーション
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "有効なメールアドレスを入力してください" }
  end

  # パスワードのバリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "有効なメールアドレスを入力してください"
end  
