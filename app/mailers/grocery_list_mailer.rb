class GroceryListMailer < ApplicationMailer
 default from: 'grocerylisttracker@gmail'
   
   def low_inventory_email(user)
      @user = user
      @url  = 'http://www.gmail.com'
      mail(to: 'grocerylisttracker@gmail.com', subject: 'Welcome to My Awesome Site')
   end
end
