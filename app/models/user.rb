class User < ApplicationRecord
  belongs_to :group
  has_many :contents
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable, :lockable, :timeoutable, :trackable
end
