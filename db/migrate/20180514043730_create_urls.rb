class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :url, null: false
      t.string :tags
      t.timestamps
    end
  end
end
