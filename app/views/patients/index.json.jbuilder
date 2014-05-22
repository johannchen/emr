json.array!(@patients) do |patient|
	json.extract! patient, :id, :full_name
end
