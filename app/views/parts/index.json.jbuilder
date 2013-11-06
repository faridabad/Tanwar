json.array!(@parts) do |part|
  json.extract! part, :name, :machine_id
  json.url part_url(part, format: :json)
end
