require 'rails_helper'

RSpec.describe Person, type: :model do
  describe '#create' do
    context 'when someone create person' do
      it 'with valid name attribute' do
        person = Person.new(name: 'Bolat')
        expect(person).to be_valid
      end

      it 'with invalid name attribute' do
        person = Person.new(name: nil)
        expect(person).not_to be_valid
      end
    end
  end
end
