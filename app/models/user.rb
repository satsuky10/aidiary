class User < ApplicationRecord
  has_many :contents
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable, :lockable, :timeoutable, :trackable
end
