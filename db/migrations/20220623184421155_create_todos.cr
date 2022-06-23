class CreateTodos < Jennifer::Migration::Base
  def up
    create_table :todos do |t|
      t.string :title, {:null => false}

      t.timestamps
    end
  end

  def down
    drop_table :todos if table_exists? :todos
  end
end
