class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable, :registerable
  devise :database_authenticatable

  has_many :categories, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :structures, dependent: :destroy
  has_many :offices, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :transports, dependent: :destroy
  has_many :transfers, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :project_statuses, dependent: :destroy
  has_many :project_typologies, dependent: :destroy
end
