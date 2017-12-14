require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "shouldn't create list with no parameters" do
    list = List.new()
    assert_not list.save
  end
  test "shouldn't create list with no title" do
    list = List.new()
    list.board = boards(:one)
    assert_not list.save
  end

  test "Shouldn't create a list with no board id" do
    list = List.new(title: "new title")
    assert_not list.save
  end
end
