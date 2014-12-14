class RemoveFreshFromNumberSets < ActiveRecord::Migration
  def up
    remove_column "number_sets", "fresh"
  end
  
  def down
    add_column "number_sets", "fresh", :boolean
  end
end
