class Visit 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :visit_date, type: Date
  field :subjective
  field :physical
  field :assessment
  field :lab
  field :plan
  field :follow_up
  field :editor
  embeds_one :vital_sign
  accepts_nested_attributes_for :vital_sign
  #embedded_one :physical
  embedded_in :patient
end
