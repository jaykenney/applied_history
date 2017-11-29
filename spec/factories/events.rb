FactoryBot.define do

  factory(:event) do
    association(:position)

    description 'Event'
    event_on    '11/1/17'
  end
end
