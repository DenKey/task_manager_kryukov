class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text 		:content
      t.references  :list, index: true
      t.datetime 	:done
      t.datetime 	:deadline
      t.integer 	:priority, default: 0

      t.timestamps null: false
    end
    add_foreign_key :todos, :lists
  end
end
