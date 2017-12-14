# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  done        :boolean          default(FALSE)
#  list_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tasks_on_list_id  (list_id)
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "shouldn't create a task with no parameters" do
    task = Task.new()
    assert_not task.save
  end


  test "shouldn't create a task with no title" do
    task = Task.new(description: "new description")
    task.list = lists(:one)
    assert_not task.save
  end

  test "shouldn't create a task with no description" do
    task = Task.new(title: "new title")
    task.list = lists(:one)
    assert_not task.save
  end

  test "Shouldn't create a task with no list id" do
    task = Task.new(title: "new title", description: "new description")
    assert_not task.save
  end

  test 'done scope only returns done tasks' do
    tasks = Task.where(done: true)
    assert_equal 1, tasks.length

    assert_equal tasks(:done).id, tasks[0].id
  end

end
