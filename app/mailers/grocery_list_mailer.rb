require 'gmail'
class GroceryListMailer < ActionMailer::Base#ApplicationMailer
  default from: 'grocerylisttracker@gmail'
   
  def low_inventory_email(arr)
    string = ""
    arr.each do |item|
      string = string + ", " + item 		
	end
	
    gmail = Gmail.new('grocerylisttracker', 'uwmcapstone')
      gmail.deliver do
	    to "grocerylisttracker@gmail"
	    subject "Your GroceryListTracker Inventory is running low!"
	    text_part do
	      body "Need to replenish " + string
	    end
	  end
	  
  	gmail.logout
  end
end
