# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "shouldn't create board with no title" do
    board = Board.new(description: "Hello world")
    assert_not board.save
  end
  test "shouldn't create board with no description" do
    board = Board.new(title: "Board")
    assert_not board.save
  end

  test "Title scope returns correct board" do
    board = Board.where(title: "MyString")
    assert_equal 2, board.length
  end

end
