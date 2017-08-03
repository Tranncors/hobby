class CitiesController < ApplicationController
    
    
    def index
      if (params[:iata] )
          @cities = City.airport_code(params[:iata])
      else
          #@cities = City.all.to_json
          @cities = City.all
          #render json: @cities
      end
    end
    
    def show
        #s = City.all
        #city = s.sort_by {|e| [e.airport[1]['city'],e.airport[1]['country']] }
        @city = City.airport_code(params[:code])
        #@city = City.where(code: ( params[:code] ))
        #@city = City.find(params[:code])
    end
end

#select * from cities where (airport->0)