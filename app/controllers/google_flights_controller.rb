class GoogleFlightsController < ApplicationController

  def index
    @airports = Airport.all.reorder(:country)
    if params[:froms].present?
     @froms = params[:froms]
     @tods = params[:tods]
     from_search_term = AirportSearchTerm.new(@froms)
     #to_search_term = AirportSearchTerm.new(@tods)
     @arigin = Airport.where(
     from_search_term.where_clause,
     from_search_term.where_args).
     order(from_search_term.order)
     #@destination =  Airport.where(
     #to_search_term.where_clause,
     #to_search_term.where_args).
     #order(to_search_term.order)
     @origin = @arigin.to_a
    else
     @origin = []
     #@destination = []
    end
    respond_to do |format|
     format.html {}
     format.json { render json: @origin }
    end
  end  
  
  def  show   
     #@response.key = 'AIzaSyAaLHEBBLCI4aHLNu2jHiiAQGDbCunBQX0'
    #@flightapi = GoogleFlight::search.new
    #@respon = @flightapi.search(2, 'lga', 'atl', '2014-08-05', '2014-08-09')
    #respond_to do |format|
    #    format.html 
    #    format.json {render @response}
    #end
  end
    
end    