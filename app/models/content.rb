class Content < ApplicationRecord
  belongs_to :user
  include UidModule
  def soft_destroy
    update(deleted_at: Time.current)
  end

  def self.active
    where(deleted_at: nil)
  end

  def save_generated_output
    update(output_body: generate_output)
  end

  def generate_output
    'むかしむかしあるところに' + input_words + 'がいましたよん'
  end
end
