#class GoogleFlight
 module GoogleFlight
     extend ActiveSupport::Concern
     
require 'google/apis/qpx_express_v1'
  QpxExpress = Google::Apis::QpxExpressV1 # Alias the module
private

  def set_flight
     
parami =              {
               request: {
                 passengers: {
                   adult_count: 1
                 },
                 slice: [
                   {
                     origin: "BOS",
                     destination: "LAX",
                     date: "2017-10-14"
                   },
                   {
                     origin: "LAX",
                     destination: "BOS",
                     date: "2017-11-14"
                   }
                 ],
                 solutions: "20"
               }
             }

     service = QpxExpress::QPXExpressService.new
     service.key = 'AIzaSyCHMEmsDZ1zvRQoyrqG1wJ0ROv-TM1gYBs' 
     #search_trips_request_object = parami
     #@response = service.search_trips( search_trips_request_object, fields: 'trips(trip_option(pricing(fare(basis_code,carrier,origin,destination),latest_ticketing_time,sale_total)))' )
    #@response = JSON.parse(ponse)
   # @response = @service.search_trips( search_trips_request_object, fields: 'trips(trip_option)' )
 end
 
#@response = RestClient.post 'https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyCHMEmsDZ1zvRQoyrqG1wJ0ROv-TM1gYBs',parami,headers = {'content-type': 'application/json'}


#finde = QpxExpress::SearchTripsRequest.new
#finde.max_price = '$102.07'
#@esponse = finde.request


#, fields: 'slice(orign,destination)'
end