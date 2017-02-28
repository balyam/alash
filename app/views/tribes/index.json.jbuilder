json.array!(@tribes) do |tribe|
  json.extract! tribe, :id, :name, :text
  json.url tribe_url(tribe, format: :json)
end
