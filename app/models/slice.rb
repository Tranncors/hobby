class Slice < Struct.new(:date, :origin, :destination)
    include ActiveModel::Model
    
    #belongs_to :request
   #attr :date
   #attr :origin
   #attr :destination
   
end