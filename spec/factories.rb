FactoryGirl.define do
	factory :user do
		sequence(:email) {|n| "user#{n}@example.com"}
		password "secretpass"
		password_confirmation "secretpass"
		first_name "Mary"
		last_name "Chen"
		admin false
	end	

	factory :admin, class: User do
		sequence(:email) {|n| "admin#{n}@example.com"}
		password "secretpass"
		password_confirmation "secretpass"
		first_name "John"
		last_name "Chen"
		admin true
	end
end