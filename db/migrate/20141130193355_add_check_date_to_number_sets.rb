class AddCheckDateToNumberSets < ActiveRecord::Migration
  def up
    add_column "number_sets", "check_date", :datetime
  end
  
  def down
    remove_column "number_sets", "check_date"
  end
end
