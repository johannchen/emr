class Diagnosis
  include Mongoid::Document
  include Mongoid::Timestamps
# include Mongoid::Versioning
#	include Mongoid::History::Trackable

  field :name
  field :year
  field :details
  field :editor
  embedded_in :patient 

#	track_history :scope => :patient
end
