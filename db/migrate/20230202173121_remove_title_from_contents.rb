class RemoveTitleFromContents < ActiveRecord::Migration[7.0]
  def change
    remove_column :contents, :title
  end
end
