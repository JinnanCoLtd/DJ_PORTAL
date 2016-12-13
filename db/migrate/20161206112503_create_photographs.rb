class CreatePhotographs < ActiveRecord::Migration[5.0]
  def change
    create_table :photographs do |t|
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
