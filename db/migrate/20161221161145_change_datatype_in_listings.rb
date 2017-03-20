class ChangeDatatypeInListings < ActiveRecord::Migration[5.0]
  def change
  	change_column :listings, :playing_years, :string
  	change_column :listings, :playing_per_year, :string
  end
end
