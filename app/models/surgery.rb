class Surgery 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :year
  field :details
  field :editor
  embedded_in :patient
end
