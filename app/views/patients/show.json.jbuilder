json.(@patient, :id, :sid, :full_name, :first_name, :last_name, :gender, :birthday, :email, :phone, :age)
json.allergies @patient.allergies, :id, :name
json.reactions @patient.reactions, :id, :medication, :name
