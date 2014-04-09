class Medication 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :script , type: String
  field :detail, type: String
  embedded_in :patient, :inverse_of => :medications
end
