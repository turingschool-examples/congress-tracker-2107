class CongressService 
    def self.senate_members
        Rails.cache.fetch("all-senate-members") do 
            response = conn.get("/congress/v1/116/senate/members.json")
            parse_json(response)
        end 
    end 

    def self.house_members(state)
        response = conn.get("/congress/v1/members/house/#{state}/current.json")
        parse_json(response)
    end 

    def self.conn 
        Faraday.new(url: "https://api.propublica.org") do |faraday|
            faraday.headers["X-API-KEY"] = ENV['govt_api_key']
        end
    end 

    def self.parse_json(response) 
        JSON.parse(response.body, symbolize_names: true)
    end 

end 