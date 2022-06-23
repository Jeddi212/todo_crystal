require "kemal"

require "../dto/todo_dto"
require "../service/todo_service"

get "/todos" do

end

get "/todos:id" do

end

post "/todos" do |ctx|
  todo_dto = CreateTodosDto.from_json ctx.request.body.not_nil!
  {title: todo_dto.title}.to_json
  TodoService.save(todo_dto)
end

put "/todos:id" do |ctx|
  
end

delete "/todos:id" do
  
end

