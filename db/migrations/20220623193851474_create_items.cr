class CreateItems < Jennifer::Migration::Base
  def up
    create_table :items do |t|
      t.reference :todos, :integer, {:column => :todo_id}
      
      t.bool :checked, {:default => false}
      t.integer :todo_id, {:null => false}
      t.string :name, {:null => false}

      t.timestamps
    end

    change_table :items do |t|
      t.drop_column :todos_id
    end
  end

  def down
    drop_table :items if table_exists? :items
  end
end
