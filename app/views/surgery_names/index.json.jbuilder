json.array!(@surgeries) do |surgery|
	json.extract! surgery, :id, :name
end
