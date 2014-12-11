class AddDrawnNumsToNumberSets < ActiveRecord::Migration
  def up
    add_column "number_sets", "drawn_nums", :string
  end
  
  def down
    remove_column "number_sets", "drawn_nums"
  end
end
