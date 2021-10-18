class CongressController < ApplicationController
  # coordination logic

  # controller > Facade (service call) > Service (call api and parse response) 
  # > Facade (manage data and create object(s) to send back to the controller) > Controller (receives object back from Facade, and sends to the view)

  def search
    @member = CongressFacade.one_senate_member(params[:search])
  end

  def search_state
    state = params[:state]
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    json = JSON.parse(response.body, symbolize_names: true)

    @house_members = json[:results]
  end
end
