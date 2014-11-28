class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.integer :number_set_id

      t.timestamps
    end
  end
end
