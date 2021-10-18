require 'rails_helper'
# testing guide:
    # - testing the return value of that facade method (test for object(s))

describe CongressFacade do 
    it '#one_senate_member returns a senate member object' do 
        senate_member = CongressFacade.one_senate_member("Hirono")

        expect(senate_member).to be_a SenateMember
        expect(senate_member.last_name).to eq('Hirono')
    end 
end 