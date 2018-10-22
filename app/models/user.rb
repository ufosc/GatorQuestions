class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_and_belongs_to_many :permissions
  belongs_to :primary_role, class_name: 'Role', required: false

  def role?
    self.primary_role != nil
  end

  def is_professor?
    self.role? && self.primary_role.id == Role::PROFESSOR_ID
  end

  def is_admin?
    self.role? && self.primary_role.id == Role::ADMIN_ID
  end

  def is_student?
    self.role? && self.primary_role.id == Role::STUDENT_ID
  end

end
