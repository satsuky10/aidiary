class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :uid
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.text :input_words
      t.text :output_body
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
