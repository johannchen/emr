class Visit 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :visit_date, type: Date
  field :subjective
  field :assessment
  field :lab
  field :treatment
  field :follow_up
  field :editor
  
  embeds_one :vital_sign
  embeds_one :physical
  accepts_nested_attributes_for :vital_sign
  accepts_nested_attributes_for :physical
  embedded_in :patient
end
