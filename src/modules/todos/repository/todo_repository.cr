require "../../../models/*"

module TodoRepository
  def self.save(todo : Todos)
    # todo = Todos.build(todos)
    todo.save
  end
end
