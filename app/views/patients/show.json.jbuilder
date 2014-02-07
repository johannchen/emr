json.(@patient, :id, :sid, :full_name, :first_name, :last_name, :gender, :birthday, :email, :phone)
json.allergies @patient.allergies, :id, :name
