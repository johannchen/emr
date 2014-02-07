class Patient
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :gender, type: String
  field :birthday, type: Date 
  field :email, type: String
  field :phone, type: String
  embeds_many :allergies

  def sid
    id.to_s
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
