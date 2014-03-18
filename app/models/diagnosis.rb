class Diagnosis
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :year, type: String
  field :comment, type: String
  field :deleted, type: Boolean 
  field :edited_by, type: String
  embedded_in :patient
end
