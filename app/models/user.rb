class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  has_secure_password
  
  # Instance methods
  def full_name
    "#{first_name} #{last_name}"
  end
  
  # Class methods
  def self.search(query)
    where("name LIKE ? OR email LIKE ?", "%#{query}%", "%#{query}%")
  end
end
