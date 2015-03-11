class AddPriorityToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :priority, :integer, :default => 0
  end
end
