class AddDeadlineToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :deadline, :datetime
  end
end
