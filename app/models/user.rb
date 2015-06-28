class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable
  has_many  :relationships
  has_many :meetings , :through  => :relationships
  validates :name,  presence: true, length: { maximum: 50 }
  validates :sign_up_password, format: { with: /thsdeca92541/}
  validates :phone_number, presence: true

end
