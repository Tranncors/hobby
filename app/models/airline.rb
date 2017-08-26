class Airline < ActiveRecord::Base
    
    #scope :location, ->(iata) where ("iata: '#{iata}'")
    
  def self.by_name(iata)
    where("iata: iata")
  end

    
end
