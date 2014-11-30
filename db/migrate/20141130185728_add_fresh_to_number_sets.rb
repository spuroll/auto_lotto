class AddFreshToNumberSets < ActiveRecord::Migration
  def up
    add_column "number_sets", "fresh", :boolean
  end
  
  def down
    remove_column "number_sets", "fresh"
  end
  
end
