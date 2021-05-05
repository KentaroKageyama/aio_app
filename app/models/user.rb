class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は英字と数字の両方を含めて設定してください' }

  with_options presence: true do
    validates :company
    validates :phone_number, numericality: true, length: { maximum: 11 }
    validates :zip_code, numericality: true, length: { maximum: 7 } 
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city, :address
    validates :bank, :branch
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :bank_number, numericality: true, length: { maximum: 7 }
    validates :bank_account
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :bank_type

end
