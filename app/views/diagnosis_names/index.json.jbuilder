json.array!(@diagnosis_names) do |diagnosis_name|
	json.extract! diagnosis_name, :id, :name
end
