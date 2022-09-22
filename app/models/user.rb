class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buying_historys

  with_options presence: true do
    
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'Include both letters and numbers' }, allow_nil: true

    validates :nickname, uniqueness: true
    validates :email,    uniqueness: true
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday, presence: true
  end
end
