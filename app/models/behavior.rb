class Behavior 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :details
  field :editor
  embedded_in :patient
end
