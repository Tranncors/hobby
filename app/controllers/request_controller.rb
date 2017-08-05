class RequestController < ApplicationController
require 'google/apis/qpx_express_v1'
  QpxExpress = Google::Apis::QpxExpressV1 # Alias the module 
   layout 'flights'
   
   def index
    if params[:adult_count].present?
       service = QpxExpress::QPXExpressService.new
       service.key = 'AIzaSyCHMEmsDZ1zvRQoyrqG1wJ0ROv-TM1gYBs'
       solutions = params[:solutions]
       destination = params[:destination]
       adult_count = params[:adult_count]
       child_count = params[:child_count]
       origin = params[:origin]
       date = params[:date]
       search_trips_request_object = {
 request: {
 passengers: {
 adult_count: adult_count,
 child_count: child_count
 },
 slice: [
 {
  origin: origin,
 destination: destination,
 date: date
  }],
 solutions: "20"
 }
 }
       @request = service.search_trips(search_trips_request_object, fields: 'trips(trip_option)') 
       @cities = City.all
       unless @request.trips.nil?
         @orrey = @request.trips.trip_option[0..20]
        else
         flash[:notice] = "No trips to the airport"
       end
     else
         @request = []
         @cities = City.all
     end
  end
   
   
   private 
    def request_params
      params.require(:request).permit(:email, :solution, passengers_attributes: [:adult_count, :child_count], slice_attributes:([:origin, :destination, :date]))
    end
end