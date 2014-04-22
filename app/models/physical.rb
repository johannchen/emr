class Physical 
  include Mongoid::Document

  field :heent
  field :neck
  field :respiratory
  field :cardiac
  field :abdomen
  field :back
  field :skin
  field :comment
  
  embedded_in :visit
end
