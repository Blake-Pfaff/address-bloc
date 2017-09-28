 # gives access to address_book
 require_relative '../models/address_book'

 class MenuController
   attr_reader :address_book

   def initialize
     @address_book = AddressBook.new
   end

   def main_menu
     #shows main options in cmd
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - View Entry n"
     puts "6 - Exit"
     print "Enter your selection: "

     #gets user input
     selection = gets.to_i
          #case statement operator to determine users input
     case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         create_entry
         main_menu
       when 3
         system "clear"
         search_entries
         main_menu
       when 4
         system "clear"
         read_csv
         main_menu
       when 5
         system "clear"
         entry_n_submenu
         main_menu
       when 6
         puts "Good-bye!"
         #terminates program w/ exit (0) signals exiting w/o error
         exit(0)
       #use else to stop invalid user input
       else
         system "clear"
         puts "Sorry, that is not a valid input"
         main_menu
     end
   end

   def entry_n_submenu
     print "Entry number to view: "
     selection = gets.chomp.to_i

     if selection < @address_book.entries.count
       puts @address_book.entries[selection]
       puts "Press enter to return to the main menu"
       gets.chomp
       system "clear"
     else
      puts "#{selection} is not valid input"
      entry_n_submenu
     end
   end

   def view_all_entries
       #iterate through entries in Addess
     address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s
     #call entry_submenu to display submenu for each entry
       entry_submenu(entry)
     end
     system "clear"
     puts "End of entries"
   end

   def create_entry
      # system clear will clear screen
     system "clear"
     puts "New AddressBloc Entry"
     #prompts the user for each Entry attr using print
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp

     #adds new entry to address_book using add_entry
     address_book.add_entry(name, phone, email)

     system "clear"
     puts "New entry created"
   end

   def search_entries
   end

   def read_csv
   end
      def entry_submenu(entry)
     #displays submenu options
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     # chomp removesany trailing whitespace from the string gets returns
     selection = gets.chomp

     case selection
     #when the user asks to see the next entry do nothing & ctrl trn to view_all_entries
       when "n"
     #deleting & editing later
       when "d"
       when "e"
     # returns the user to the main menu
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
    end
 end
