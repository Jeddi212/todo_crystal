require "../../../models/*"
require "../dto/todo_dto"
require "../repository/*"

module TodoService
  def self.find_all()
    TodoRepository.find_all()
  end

  def self.find_one(id : Int32)
    todo = TodoRepository.find_one(id).not_nil!
    items_dto = [] of ItemsDto

    todo.items.each { |it| items_dto << ItemsDto.new it}

    TodosDto.new todo, items_dto
  end

  def self.save(create_dto : CreateTodosDto) : TodosDto
    TodoRepository.save(Todo.new(create_dto), create_dto.items)
  end

  def self.update(id : Int32, create_dto : CreateTodosDto) : TodosDto | Nil
    todo = TodoRepository.find_one(id)
    todo.title = create_dto.title

    ItemRepository.delete_from_todo(id)
    
    TodoRepository.save(todo, create_dto.items)
  end

  def self.remove_one(id : Int32)
    TodoRepository.delete(id)
    return "Todo with id: #{id} successfully removed"
  end
end