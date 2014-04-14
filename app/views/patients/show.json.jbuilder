json.(@patient, :id, :sid, :full_name, :first_name, :last_name, :gender, :birthday, :email, :phone, :age, :nationality, :address, :occupation, :company, :created_at, :updated_at, :editor)
json.allergies @patient.allergies, :id, :name
json.medications @patient.medications, :id, :name, :script
json.reactions @patient.reactions, :id, :medication, :name
json.family_members @patient.family_members, :id, :relation, :description
