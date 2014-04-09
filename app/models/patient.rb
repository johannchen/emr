class Patient
  include Mongoid::Document
	include Mongoid::Timestamps
#  include Mongoid::Versioning
#	include Mongoid::History::Trackable

  field :first_name, type: String
  field :last_name, type: String
  field :gender, type: String
  field :birthday, type: Date 
  field :email, type: String
  field :phone, type: String
  embeds_many :allergies
  embeds_many :reactions
	embeds_many :medications
  embeds_many :diagnoses, class_name: "Diagnosis"
=begin
	track_history :modifier_field => :modifier,
		:modifer_field_inverse_of => :nil,
		:version_field => :version,
		:track_create => false,
		:track_update => true,
		:track_destroy => false
=end
  def sid
    id.to_s
  end

  def full_name
    "#{last_name}, #{first_name}"
  end

  def age
    if birthday?
      a = Date.today - birthday
      years = (a / 365).to_i
      a = a % 365 
      months = (a / 30).to_i
      days = (a % 30).to_i

      if years < 1
        if months < 1
          "#{days} days old"
        else
          "#{months} months old"
        end
      else
        "#{years} years, #{months} months old"
      end
    end
  end
end
