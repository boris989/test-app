# frozen_string_literal: true

RSpec.describe Admin::Apartment::Contract::Create, type: :contract do
  subject { described_class.new(Apartment.new) }

  it 'validates presence of address' do
    subject.validate({})
    expect(subject.errors.messages[:address]).to eq ['не может быть пустым']
  end

  it 'validates presence of comfort_level' do
    subject.validate(comfort_level: '')
    expect(subject.errors.messages[:comfort_level]).to eq ['не может быть пустым']
  end

  it 'validates presence of count_rooms' do
    subject.validate(count_rooms: '')
    expect(subject.errors.messages[:count_rooms]).to eq ['не может быть пустым']
  end

  it 'validates presence of day_price' do
    subject.validate({})
    expect(subject.errors.messages[:day_price]).to eq ['не может быть пустым']
  end

  it 'validates presence of description' do
    subject.validate({})
    expect(subject.errors.messages[:description]).to eq ['не может быть пустым']
  end

  it 'validates presence of hour_price' do
    subject.validate({})
    expect(subject.errors.messages[:hour_price]).to eq ['не может быть пустым']
  end

  it 'validates presence of owner_name' do
    subject.validate({})
    expect(subject.errors.messages[:owner_name]).to eq ['не может быть пустым']
  end

  it 'validates presence of owner_phone' do
    subject.validate({})
    expect(subject.errors.messages[:owner_phone]).to eq ['не может быть пустым']
  end
end
