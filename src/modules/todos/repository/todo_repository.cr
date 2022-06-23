require "../../../models/*"

module TodoRepository
  def self.save(todo : Todos) : Todos
    todo.save
    todo
  end
end
