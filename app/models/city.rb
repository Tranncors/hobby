class City < ActiveRecord::Base
    
    def self.to_param
        "#{airport[0]}"
    end
    
    def from(position)
      self[position, length] || []
    end
    
    def self.airport_code(code)
        #code = self.airport[0]
        where ("airport[1]['iata'] : code")
        #where("airport@> 0 -> ? code")
    end
    
    def self.code
        code = self.airport[0]
    end
end