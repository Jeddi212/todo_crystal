class CreateItems < Jennifer::Migration::Base
  def up
    create_table :items do |t|
      t.reference :todos, :integer, {:column => :todos_id}
      
      t.bool :checked, {:null => false}
      t.integer :todos_id, {:null => false}
      t.string :name, {:null => false}

      t.timestamps
    end
  end

  def down
    drop_table :items if table_exists? :items
  end
end
