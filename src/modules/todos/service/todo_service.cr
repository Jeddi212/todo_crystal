require "../../../models/*"
require "../dto/todo_dto"
require "../repository/todo_repository"

module TodoService
  def self.find_all()
    TodoRepository.find_all()
  end

  def self.find_one(id : Int32)
    todo = TodoRepository.find_one(id)
    items_dto = [] of ItemsDto

    todo.items.each { |it| items_dto << ItemsDto.new it}

    TodosDto.new todo, items_dto
  end

  def self.save(create_dto : CreateTodosDto) : TodosDto
    TodoRepository.save(Todo.new(create_dto), create_dto.items)
  end
end