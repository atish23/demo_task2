class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/profile.svg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :galleries, :dependent => :destroy
  validates :name, presence: true, length: { maximum: 25 }
  validates :avatar ,presence: true
end
