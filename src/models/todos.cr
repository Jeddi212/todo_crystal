class Todos < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    title: String,
    created_at: Time?,
    updated_at: Time?,
  )
end
