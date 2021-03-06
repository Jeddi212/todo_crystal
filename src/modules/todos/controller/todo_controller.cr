require "kemal"

require "../dto/todo_dto"
require "../service/todo_service"

get "/todos" do
  TodoService.find_all.to_json
end

get "/todos/:id" do |ctx|
  id = ctx.params.url["id"]
  TodoService.find_one(id.to_i).to_json
end

post "/todos" do |ctx|
  todo_dto = CreateTodosDto.from_json ctx.request.body.not_nil!

  ctx.response.content_type = "application/json"
  TodoService.save(todo_dto).to_json
end

put "/todos/:id" do |ctx|
  id = ctx.params.url["id"]
  todo_dto = CreateTodosDto.from_json ctx.request.body.not_nil!
  TodoService.update(id.to_i, todo_dto).to_json
end

delete "/todos/:id" do |ctx|
  id = ctx.params.url["id"]
  TodoService.remove_one(id.to_i).to_json
end

