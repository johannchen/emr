class Medication 
  include Mongoid::Document
  include Mongoid::Timestamps
	include Mongoid::History::Trackable

  field :name, type: String
  field :year, type: String
  field :comment, type: String
  field :deleted, type: Boolean 
  embedded_in :patient, :inverse_of => :medications

	track_history :on => [:name, :year], :scope => :patient
end
