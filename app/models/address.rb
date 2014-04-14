class Address 
  include Mongoid::Document
  field :province
  field :city
  field :distict
  field :street
#  embedded_in :patient
end
