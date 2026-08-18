class CreateTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :tickets do |t|
      t.references :order, null: false, foreign_key: true
      t.string :ticket_number
      t.string :status

      t.timestamps
    end
  end
end
