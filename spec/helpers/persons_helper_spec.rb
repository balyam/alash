require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PersonsHelper. For example:
#
# describe PersonsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PersonsHelper, type: :helper do
  context "some context" do
    it "some block" do
      puts "expect().to be_my_person"
    end
  end
end
