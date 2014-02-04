json.array!(@patients) do |patient|
	json.extract! patient, :sid, :full_name
end
