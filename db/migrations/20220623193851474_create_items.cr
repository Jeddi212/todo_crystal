class CreateItems < Jennifer::Migration::Base
  def up
    create_table :items do |t|
      t.bool :checked, {:null => false}
      t.integer :todo_id, {:null => false}

      t.timestamps
    end
  end

  def down
    drop_table :items if table_exists? :items
  end
end
