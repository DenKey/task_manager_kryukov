class AddDoneFieldToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :done, :datetime
  end
end
