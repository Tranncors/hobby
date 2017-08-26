class Airport < ActiveRecord::Base
    
    def location
       [ nome, city, country ].join(' , ')
    end
    def nome
        [name, "Airport"].join(' ')
    end
end
