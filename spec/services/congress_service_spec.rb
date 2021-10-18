require 'rails_helper'
# testing guide:
# - test structure of the response from the api
        # 1. what comes back from the service call (keys)
        # 2. format (place) of what comes back from the service call

describe CongressService do 
    it 'can get all senate member data' do
        response = CongressService.senate_members

        expect(response).to be_a  Hash 
        expect(response[:results][0][:members]).to be_an Array

        senate_member_data = response[:results][0][:members].first

        expect(senate_member_data).to have_key :first_name
        expect(senate_member_data[:first_name]).to be_a String
        
        expect(senate_member_data).to have_key :last_name
        expect(senate_member_data[:last_name]).to be_a String
        
        expect(senate_member_data).to have_key :twitter_account
        expect(senate_member_data[:twitter_account]).to be_a String
    end 

    it 'can get all house member data for a specific state' do 
        response = CongressService.house_members('CO')

        expect(response).to be_a  Hash 
        expect(response[:results]).to be_an Array

        house_member_data = response[:results].first

        expect(house_member_data).to have_key :name
        expect(house_member_data[:name]).to be_a String
        
        expect(house_member_data).to have_key :role
        expect(house_member_data[:role]).to be_a String
        
        expect(house_member_data).to have_key :party
        expect(house_member_data[:party]).to be_a String

        expect(house_member_data).to have_key :district
        expect(house_member_data[:district]).to be_a String
    end 
end 