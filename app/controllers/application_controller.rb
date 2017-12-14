class ApplicationController < ActionController::API
  def get_current_board
    @board = Board.find(params[:board_id])
  end

  def get_current_list
    @list = List.find(params[:list_id])
  end
end
