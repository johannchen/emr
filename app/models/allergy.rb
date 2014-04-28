class Allergy
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :reaction
  field :editor

  embedded_in :patient
end
