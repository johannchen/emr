class Address 
  include Mongoid::Document
  field :province
  field :city
  field :district
  field :street

  embedded_in :patient
end
