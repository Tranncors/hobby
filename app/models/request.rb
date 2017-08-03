class Request
    attr_accessor :adult_count, :child_count, :origin, :destination, :date, :solution
  #def slice
  #    [@slice1, @slice2]
  #end
  
  #def slice_attributes=(attributes)
  #    {origin,destination,date}
  #end

   #attr :email
   def self.from_hash(hash)
     obj = self.new
     hash.each {|key,value| obj.send("#{key}=", value)}
     obj
   end

end