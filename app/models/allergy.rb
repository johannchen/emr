class Allergy
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :reaction
  field :details
  field :editor

  embedded_in :patient
end
