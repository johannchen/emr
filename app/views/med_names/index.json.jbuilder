json.array!(@meds) do |med|
	json.extract! med, :id, :name
end
