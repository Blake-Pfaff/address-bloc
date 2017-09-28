 puts "Welcome to AddressBloc!"
 require_relative 'controllers/menu_controller'

 #creates a new MenuCtrl when AddressBloc starts
 menu = MenuController.new
 #uses system clear to clear cmd line
 system "clear"
 puts "Welcome to AddressBloc!"
 #calls menu.main menu to display menu
 menu.main_menu
