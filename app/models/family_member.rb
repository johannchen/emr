class FamilyMember 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :relation
  field :description
  field :editor
  embedded_in :patient
end
