class CongressFacade 
    # calling to service to get data, and then manipulating that data
    def self.one_senate_member(search_param)
        data = CongressService.senate_members

        members = data[:results][0][:members]

        found_members = members.find_all {|m| m[:last_name] == search_param}
        member = found_members.first
        SenateMember.new(member)
    end 
end 