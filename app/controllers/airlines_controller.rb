class AirlinesController < ApplicationController
    
   def index
     @airlines = Airline.all
     
     respond_to do |format|
      format.html
      format.json { render json: @airlines }
     end
   end
    
end    