require 'gmail'
class GroceryListMailer < ActionMailer::Base#ApplicationMailer
  default from: 'grocerylisttracker@gmail.com'
   
  def low_inventory_email(arr, user)
    string = ""
    arr.each do |item|
      string = string + " " + item 		
	end
	
    gmail = Gmail.new('grocerylisttracker', 'uwmcapstone')
      gmail.deliver do
	    to user.email #"grocerylisttracker@gmail.com"
	    subject "Your GroceryListTracker Inventory is running low!"
	    text_part do
	      body "Need to replenish " + string
	    end
	  end
	  
  	gmail.logout
  end
end
