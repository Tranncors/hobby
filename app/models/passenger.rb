class Passenger < Struct.new(:adult_count, :child_count)
    include ActiveModel::Model
    
    belongs_to :request
    #attr :adult_count
    #attr :child_count
    
end