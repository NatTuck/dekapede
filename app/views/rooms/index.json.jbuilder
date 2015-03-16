json.array!(@rooms) do |room|
  json.extract! room, :id, :layer_id, :pos_x, :pos_y, :desc, :props
  json.url room_url(room, format: :json)
end
