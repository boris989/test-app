# frozen_string_literal: true

RSpec.describe CityRegion, type: :model do
  subject { build(:city_region) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
