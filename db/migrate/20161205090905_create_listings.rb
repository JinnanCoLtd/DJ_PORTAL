class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string  :location
      t.string :playing_years
      t.string :playing_per_year
      t.string :genre_main
      t.string :genre_playable
      t.string :main_equipments
      t.string :listing_title
      t.text :listing_content
      t.integer :guarantee
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
