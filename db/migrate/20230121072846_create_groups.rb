class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :uid
      t.string :name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
