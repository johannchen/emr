class Diagnosis
  include Mongoid::Document
  field :name, type: String
  field :year, type: String
  field :comment, type: String
  field :deleted, type: Boolean 
  field :edited_by, type: String
  field :edited_at, type: DateTime
  embedded_in :patient
end
