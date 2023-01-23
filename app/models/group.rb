class Group < ApplicationRecord
  validates :name, presence: true
  def soft_destroy
    update(deleted_at: Time.current)
  end

  def self.active
    where(deleted_at: nil)
  end
end
