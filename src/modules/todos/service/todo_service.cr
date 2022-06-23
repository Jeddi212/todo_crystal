require "../../../models/*"
require "../dto/todo_dto"
require "../repository/todo_repository"

module TodoService
  def self.save(create_dto : CreateTodosDto) : TodosDto
    TodosDto.new TodoRepository.save Todos.new create_dto
  end
end