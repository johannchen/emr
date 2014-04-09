json.(@patient, :id, :sid, :full_name, :first_name, :last_name, :gender, :birthday, :email, :phone, :age)
json.allergies @patient.allergies, :id, :name
json.medications @patient.medications, :id, :name, :script
json.reactions @patient.reactions, :id, :medication, :name
