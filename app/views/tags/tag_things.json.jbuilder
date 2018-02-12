json.array!(@tag_things) do |tt|
  json.extract! tt, :id, :thing_id, :image_id, :priority, :creator_id, :created_at, :updated_at
  json.thing_name tt.thing_name        if tt.respond_to?(:thing_name)
  json.image_caption tt.image_caption  if tt.respond_to?(:image_caption)
  json.image_content_url image_content_url(tt.image_id)    if tt.image_id
  if tt.respond_to?(:lng) && tt.lng
    json.position do
      json.lng tt.lng
      json.lat tt.lat
    end
  end
end
