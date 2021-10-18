require 'rails_helper'
# testing guide:
    # - just like testing a plain old ruby class (mod 1)
    # - test attributes 
    # - test methods

describe SenateMember do 
    it 'has attributes' do 
        senate_member = SenateMember.new(senate_member_data)

        expect(senate_member.first_name).to eq("Lamar")
        expect(senate_member.last_name).to eq("Alexander")
        expect(senate_member.twitter_account).to eq("SenAlexander")
    end 
end 