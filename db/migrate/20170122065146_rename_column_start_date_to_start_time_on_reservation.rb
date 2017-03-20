class RenameColumnStartDateToStartTimeOnReservation < ActiveRecord::Migration[5.0]
  def change
  	rename_column :reservations, :start_date, :start_time
  end
end
