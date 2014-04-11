class Medication 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :script
  field :details
  field :editor
  embedded_in :patient, :inverse_of => :medications
end
