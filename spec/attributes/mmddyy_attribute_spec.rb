require 'rails_helper'

RSpec.describe MmddyyAttribute, type: :model do
  specify do
    expect(MmddyyAttribute.new.cast('2/20/16')).to eq Date.civil(2016,2,20)
  end
end
