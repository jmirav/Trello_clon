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

class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy
  validates :title, presence: true
end
