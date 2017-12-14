require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = List.last
    @board = @list.board
  end

  test 'get index: is successful' do
    get api_v1_board_lists_path(locale: 'es', board_id: @board)
    assert_response :success
  end

  # test 'get show: is successful' do
  #   get api_v1_list_path(locale: 'es', id: @list)
  #   assert_response :success
  # end

  test 'post create: creates a list' do
    assert_difference 'List.count', 1 do
      post api_v1_board_lists_path(locale: 'es', board_id: @board), params: {list: {title: 'new list'}}
      assert_response :success

      assert_equal 'new list', List.last.title
    end
  end

  test 'put update: edits a list title' do
    assert_difference 'List.count', 0 do
      put api_v1_board_list_path(locale: 'es', board_id: @board, id: @list), params: {list: {title: 'edited list title'}}
      assert_response :success

      assert_equal 'edited list title', List.last.title
    end
  end

  test 'delete destroy: destroys a list' do
    assert_difference 'List.count', -1 do
      delete api_v1_board_list_path(locale: 'es', board_id: @board, id: @list)
      assert_response :success
    end
  end
end
