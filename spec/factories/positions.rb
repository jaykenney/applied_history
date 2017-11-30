FactoryBot.define do
  factory(:position) do
    association(:user)

    employer 'The Moon'
    title    'Whaler'

    trait :with_event do

      transient do
        event_description 'Event'
      end

      after(:create) do |position, evaluator|
        create(:event, description: evaluator.event_description, position: position)
      end
    end
  end
end
