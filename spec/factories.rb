FactoryGirl.define do
	factory :user do
		sequence(:email) {|n| "user#{n}@example.com"}
		password "secretpass"
		password_confirmation "secretpass"
		admin false
	end	

	factory :admin, class: User do
		sequence(:email) {|n| "admin#{n}@example.com"}
		password "secretpass"
		password_confirmation "secretpass"
		admin true
	end
end