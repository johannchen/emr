class Patient
  include Mongoid::Document
	include Mongoid::Timestamps
#	include Mongoid::History::Trackable

  field :first_name
  field :last_name
  field :gender
  field :birthday, type: Date 
  field :email
  field :phone
  field :nationality
  field :occupation
  field :company
  field :department
  field :insurance
  field :editor

  embeds_one :address
  embeds_many :allergies
	embeds_many :medications
	embeds_many :surgeries
	embeds_many :behaviors
  embeds_many :family_members
  embeds_many :visits
  embeds_many :diagnoses, class_name: "Diagnosis"

  accepts_nested_attributes_for :address

  scope :search_profile, ->(text){ self.or({first_name: /#{text}/},{last_name: /#{text}/},{phone: /#{text}/}).asc }

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

  def self.search(text)
    search_profile(text) unless text.empty?
  end
end
