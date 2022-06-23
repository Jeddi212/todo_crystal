class Items < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    checked: Bool,
    todo_id: Int32,
    created_at: Time?,
    updated_at: Time?,
  )
end
