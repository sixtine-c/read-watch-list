class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :overview
      t.string :poster_url
      t.integer :year
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
