class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :items
  #has_many :buying_historys

  with_options presence: true do
    
 VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'


    validates :nickname, uniqueness: true
    
    validates :first_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
    validates :last_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
    validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday, presence: true
  end
end
