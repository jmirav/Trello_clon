# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  title      :string
#  board_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lists_on_board_id  (board_id)
#

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
