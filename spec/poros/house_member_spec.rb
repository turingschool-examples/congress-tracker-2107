require 'rails_helper'
# testing guide:
    # - just like testing a plain old ruby class (mod 1)
    # - test attributes 
    # - test methods

describe HouseMember do 
    it 'has attributes' do 
        house_member_data = {:id=>"N000191",
            :name=>"Joe Neguse",
            :first_name=>"Joe",
            :middle_name=>nil,
            :last_name=>"Neguse",
            :suffix=>nil,
            :role=>"Representative",
            :gender=>"M",
            :party=>"D",
            :times_topics_url=>nil,
            :twitter_id=>"RepJoeNeguse",
            :facebook_account=>nil,
            :youtube_id=>nil,
            :seniority=>"4",
            :next_election=>"2022",
            :api_uri=>"https://api.propublica.org/congress/v1/members/N000191.json",
            :district=>"2",
            :at_large=>false}

        house_member = HouseMember.new(house_member_data)

        expect(house_member.name).to eq("Joe Neguse")
        expect(house_member.role).to eq("Representative")
        expect(house_member.party).to eq("D")
        expect(house_member.district).to eq("2")
    end 
end 