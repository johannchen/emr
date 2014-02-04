FactoryGirl.define do
	factory :user do
		sequence(:email) {|n| "user#{n}@example.com"}
		password "secretpass"
		password_confirmation "secretpass"
		first_name "Mei-Lin"
		last_name "Chen"
		admin false
	end	

	factory :admin, class: User do
		sequence(:email) {|n| "admin#{n}@example.com"}
		password "secretpass"
		password_confirmation "secretpass"
		first_name "Johann"
		last_name "Chen"
		admin true
	end

  factory :patient do
    first_name "Sophie"
    last_name "Chen"
  end
end
