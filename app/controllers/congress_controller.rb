class CongressController < ApplicationController
  # coordination logic

  # controller > Facade (service call) > Service (call api and parse response) 
  # > Facade (manage data and create object(s) to send back to the controller) > Controller (receives object back from Facade, and sends to the view)

  def search
    @member = CongressFacade.one_senate_member(params[:search])
  end

  def search_state
    @state = params[:state]
    @house_members = CongressFacade.house_members_for_state(params[:state])
  end
end
