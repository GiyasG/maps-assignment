json.array @thingsfortag, :id, :name, :created_at, :updated_at

# json.array!(@tag) do |tt|
#   json.extract! tt, :id, :name, :created_at, :updated_at
#   json.tag_name tt.tag_name        if tt.respond_to?(:tag_name)
# end

# json.array!(@thing_tags) do |tt|
#   json.extract! tt, :id, :name, :created_at, :updated_at
#   json.thing_tags_name tt.thing_tags_name        if tt.respond_to?(:thing_tags_name)
# end
