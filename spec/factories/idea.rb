FactoryGirl.define do
	factory :idea, :class => Idea do
		title { Faker::Lorem.sentence }
		description { Faker::Lorem.paragraph }
		username { Faker::Internet.user_name }
	end
	factory :nil_idea, :class => Idea do
		title nil
		description nil
		username nil
	end
	factory :empty_idea, :class => Idea do
		title ""
		description ""
		username ""
	end
end
