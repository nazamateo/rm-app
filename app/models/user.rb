class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:admin, :requestor]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :requestor
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end