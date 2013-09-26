json.array!(@details) do |state|
  json.extract! state, :name_det, :id
end
