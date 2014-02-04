class Patient
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :gender, type: String
  field :birthday, type: Date 

  def sid
    id.to_s
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(name)
    if name.blank?
      all
    else
      for_js("this.first_name.match(param) ||
            this.last_name.match(param)", param: "/#{name}/")
    end
  end
end
