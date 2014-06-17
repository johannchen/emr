class FamilyMember 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :relation
  field :details
  field :editor
  field :patient_id
  field :name
  embedded_in :patient
end
