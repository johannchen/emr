class Physical 
  include Mongoid::Document
  
  field :general
  field :heent
  field :neck
  field :respiratory
  field :cardiac
  field :abdomen
  field :gu
  field :rectal
  field :extremities
  field :back
  field :skin
  field :breast
  field :neuro
  field :psych
  
  embedded_in :visit
end
