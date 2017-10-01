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
<<<<<<< HEAD
     puts "7 - GTFO"
=======
     puts "7 - IVE COME HERE TO KICK ASS AND CHEW GUM...AND IM ALL OUT OF GUM"
>>>>>>> checkpoint_8
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
       when 7
        system "clear"
        puts "KABOOM"
        nuke
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
     #gets name user wants to search for and stores it in name
     print "Search by name: "
     name = gets.chomp
     #call search on address_book rtn nil or never rtn an empty strng
     match = address_book.binary_search(name)
     system "clear"
     #check if search rtn match.  if true puts match.to_s if false pust message
     if match
       puts match.to_s
       search_submenu(match)
     else
       puts "No match found for #{name}"
     end

   end

   def read_csv
    #prompt user for name of CSV file to import
     print "Enter CSV file to import: "
      file_name = gets.chomp

      # check to see if file name is empty.  if so rtn user back t othe main menu
     if file_name.empty?
       system "clear"
       puts "No CSV file read"
       main_menu
     end

     # import file with import_from_csa
     begin #prtcts the prog from crashing also uses "rescue"
       entry_count = address_book.import_from_csv(file_name).count
       system "clear"
       puts "#{entry_count} new entries added from #{file_name}"
     rescue
       puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
       read_csv
     end
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
        #user views submenu & press d, delete_entry called, ctrl will rtn to view_all_entries & display nxt entrie
        delete_entry(entry)
       when "e"
        # call edit_entry when user presse e.  display syb-menu with entry_submenu under edit
        edit_entry(entry)
        entry_submenu(entry)
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
<<<<<<< HEAD
    def nuke
    address_book.entries = 0
    main_menu
    end
=======

   def delete_entry(entry)
     address_book.entries.delete(entry)
     puts "#{entry.name} has been deleted"
   end

   def edit_entry(entry)
     #preform a series of print stmnts w/ chomp.  each get.chomp stmnt gathers user input & assigns it to vars
     print "Updated name: "
     name = gets.chomp
     print "Updated phone number: "
     phone_number = gets.chomp
     print "Updated email: "
     email = gets.chomp
     # "!" to set attrs on entry if vaild attr was read from user input
     entry.name = name if !name.empty?
     entry.phone_number = phone_number if !phone_number.empty?
     entry.email = email if !email.empty?
     system "clear"
     # prints entry with upadted attrs
     puts "Updated entry:"
     puts entry
   end

   def search_submenu(entry)
     #print submenu for entry
     puts "\nd - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"
     # save the user input to selection
     selection = gets.chomp

     #case statement & specific action from user input.
     case selection
       when "d"
         system "clear"
         delete_entry(entry)
         main_menu
       when "e"
         edit_entry(entry)
         system "clear"
         main_menu
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         puts entry.to_s
         search_submenu(entry)
     end
   end
>>>>>>> checkpoint_8
 end
