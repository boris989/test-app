# frozen_string_literal: true

RSpec.describe Admin::Apartment::Operation::Create, type: :operation do
  let(:params) do
    HashWithIndifferentAccess.new(apartment: attributes_for(:apartment))
  end

  it 'results is true' do
    result = described_class.call(params)
    expect(result.success?).to be_truthy
  end

  it 'creates apartments' do
    expect do
      described_class.call(params)
    end.to change(Apartment, :count).by(1)
  end
end
