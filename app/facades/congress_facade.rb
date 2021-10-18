class CongressFacade 
    # calling to service to get data, and then manipulating that data
    def self.one_senate_member(search_param)
        data = CongressService.senate_members

        members = data[:results][0][:members]

        found_members = members.find_all {|m| m[:last_name] == search_param}
        member = found_members.first
        SenateMember.new(member)
    end 

    def self.house_members_for_state(state)
        house_members_data = CongressService.house_members(state)[:results]

        house_members_data.map do |member_data|
            HouseMember.new(member_data)
        end 
    end 
end 