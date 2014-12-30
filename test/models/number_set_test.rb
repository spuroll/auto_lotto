require 'test_helper'

class NumberSetTest < ActiveSupport::TestCase
  def setup
    @number_set = NumberSet.new(set: "45 87 65 48 45 98", check_date: "2015-01-12")
  end
  
  test "should be valid" do
    assert @number_set.valid?
  end
end
