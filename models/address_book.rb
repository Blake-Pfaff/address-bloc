 # #8
 require_relative 'entry'

   class AddressBook
     attr_reader :entries

     def initialize
       @entries = []
       puts "test"
     end


   def add_entry(name, phone_number, email)
     # #9
     index = 0
     entries.each do |entry|
     # #10
       if name < entry.name
         break
       end
       index+= 1
     end
     # #11
     entries.insert(index, Entry.new(name, phone_number, email))
   end

   def remove_entry(name, phone_number, email)
    delete_entry = nil

    @entries.each do |entry|
      if name == entry.name && phone == entry.phone_number && entry.email
        delete_entry = Entry
      end
    end

      @entries.delete(delete_entry)

   end

 end

