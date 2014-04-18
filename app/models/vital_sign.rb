class VitalSign 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :blood_pressure
  field :pulse
  field :respiratory_rate
  field :temperature
  field :weight
  field :height
  field :pediatric_hc
  field :oxygen_saturation
  field :bmi
  embedded_in :visit
end
