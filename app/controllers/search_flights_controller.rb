class SearchFlightsController < ApplicationController
    
include GoogleFlight 
#before_action :set_flight, only:[:index]

   def index
      if params[:keywords].present?
        @arrey = @response
      #@orrey = @arrey.to_h
        @orrey = @arrey.trips.trip_option[0..20]
      else
        @orrey = []
      end
      
      respond_to do |format|
         format.html #{render html: @orrey}
         format.json {render json: @arrey}
      end
      
   end 
    
end