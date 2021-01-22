class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: ' Full-width characters' } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'Full-width katakana characters' } do
    validates :first_name_kana
    validates :family_name_kana
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' },
                       length: { minimum: 6 }

  has_many :items, dependent: :destroy
  has_many :buys, dependent: :destroy
  has_many :comments, dependent: :destroy
end
