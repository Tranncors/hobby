class AirportSearchTerm
  attr_reader :where_clause, :where_args, :order
 
   def initialize(search_term)
      
      @where_clause = ""
      @where_args = {}
      if search_term =~ /^\w{1,3}$/
        search_term = search_term.downcase
        build_for_iata_search(search_term)
      else
        search_term = search_term.downcase  
        build_for_city_search(search_term)
      end
   end
    
    def build_for_city_search(search_term)
      @where_clause << case_insensitive_search(:city)
      @where_args[:city] = starts_with(search_term)
      @where_clause << " OR #{case_insensitive_search(:country)}"
      @where_args[:country] = starts_with(search_term)
      @where_clause << " OR #{case_insensitive_search(:name)}"
      @where_args[:name] = starts_with(search_term)      
      @order = "country asc"
    end
    
    def build_for_iata_search(search_term)
      @where_clause << case_insensitive_search(:iata)
      @where_args[:iata] = starts_with(search_term)
      @order = "country asc"
    end  

    def starts_with(search_term)
      search_term + "%"
    end

    def case_insensitive_search(field_name)
      "lower(#{field_name}) like :#{field_name}"
    end
    
end    