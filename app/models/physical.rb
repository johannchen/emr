class Physical 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description
#  embedded_in :visit
end
