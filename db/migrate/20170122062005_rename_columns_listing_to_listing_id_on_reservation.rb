class RenameColumnsListingToListingIdOnReservation < ActiveRecord::Migration[5.0]
  def change
  	rename_column :reservations, :listing, :listing_id
  end
end
