class Reaction
  include Mongoid::Document
  field :medication, type: String
  field :name, type: String
  embedded_in :patient
end
