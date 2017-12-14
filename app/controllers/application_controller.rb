class ApplicationController < ActionController::API
  def get_current_board
    @board = Board.find(params[:board_id])
  end
end
