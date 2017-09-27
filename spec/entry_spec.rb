 require_relative '../models/entry'
 # #1
 RSpec.describe Entry do
   # #2
   describe "attributes" do
     # #3
     it "responds to name" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       # #4
       expect(entry).to respond_to(:name)
     end

     it "responds to phone number" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(entry).to respond_to(:phone_number)
     end

     it "responds to email" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(entry).to respond_to(:email)
     end
   end
 end

