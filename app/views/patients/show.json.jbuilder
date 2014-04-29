json.(@patient, :id, :sid, :full_name, :first_name, :last_name, :gender, :birthday, :email, :phone, :age, :nationality, :address, :occupation, :company, :created_at, :updated_at, :editor)
json.allergies @patient.allergies, :id, :name, :reaction
json.medications @patient.medications, :id, :name, :script
json.surgeries @patient.surgeries, :id, :name, :year
json.behaviors @patient.behaviors, :id, :name, :details
json.family_members @patient.family_members, :id, :relation, :description
if @last_visit
	json.visit @last_visit, :id, :visit_date, :subjective, :assessment, :lab, :treatment, :follow_up, :editor
end
if @vital_sign
	json.vital_sign @vital_sign, :blood_pressure, :pulse, :respiratory_rate, :temperature, :weight, :height, :pediatric_hc, :oxygen_saturation, :bmi
end
