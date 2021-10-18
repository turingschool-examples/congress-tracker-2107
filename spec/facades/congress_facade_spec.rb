require 'rails_helper'
# testing guide:
    # - testing the return value of that facade method (test for object(s))

describe CongressFacade do 
    it '#one_senate_member returns a senate member object' do 
        senate_member = CongressFacade.one_senate_member("Hirono")

        expect(senate_member).to be_a SenateMember
        expect(senate_member.last_name).to eq('Hirono')
    end 

    it '#house_members_for_state() returns collection of HouseMember objects' do 
        house_members = CongressFacade.house_members_for_state("CO")

        expect(house_members).to be_a Array 
        expect(house_members.first).to be_a HouseMember
    end 
end 