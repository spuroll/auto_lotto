class CreateNumberSets < ActiveRecord::Migration
  def change
    create_table :number_sets do |t|
      t.string :set
      t.integer :user_id

      t.timestamps
    end
  end
end
