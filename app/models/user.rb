class User < ApplicationRecord
  before_destroy :admin_destroy_check
  before_update :admin_update_check

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :tasks, dependent: :destroy

  private

    def admin_destroy_check
      if User.where(admin: true).count == 1 && self.admin == true
        throw(:abort)
      end
    end

    def admin_update_check
      if User.where(admin: true).count == 1 && self.admin == false
        throw(:abort)
      end
    end
end
