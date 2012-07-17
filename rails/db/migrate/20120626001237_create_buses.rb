class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.integer :seats
      t.integer :company_id

      t.timestamps
    end
  end
end
