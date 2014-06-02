class SurgeryName
  include Mongoid::Document

  field :name

  validates_uniqueness_of :name
end
