require 'rails_helper'

RSpec.describe Union, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "basic Union's model method's" do
    it "creates new union" do
      
    end
  end
  describe '#create' do
    context 'when admin create union' do
      it 'is valid with valid attributes' do
        union = Union.new(name: 'Karakesek')
        expect(union).to be_valid        
      end
      
      it 'is attribute name is nil' do
        union = Union.new(name: nil)        
        expect(union).not_to be_valid
      end
      
    end
  end
end
