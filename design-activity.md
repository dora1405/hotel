-----Activity: Evaluating Responsibility-----
Prompts:
What classes does each implementation include? Are the lists the same?
Both implementations contain the same classes: CartEntry, ShoppingCart and Order.

Write down a sentence to describe each class.
CartEntry: Has information about the unit price and quantity of an item the shopper wants to purchase.
ShoppingCart: Has information on ALL the items the shopper wants to purchase.
Order: Has information to calculate the total cost of the items the shopper wants to purchase.

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
The class Order's instance variable - @cart - makes an instance of ShoppingCart and takes all the items within the shopping cart to calculate the total price (plus sales tax) of the order. Order has a One to One relationship with ShoppingCart.
The class ShoppingCart has an instance variable - @entries - which can contain an array of CartEntry objects by having instances of CartEntry shoveled/pushed into the @entries array. ShoppingCart has a One to Many relationship with CartEntry (i.e ShoppingCart 1 - * CartEntry)

What data does each class store? How (if at all) does this differ between the two implementations?
CartEntry: unit price, quantity
ShoppingCart: entries
Order: cart
The data in each class did not differ between the two implementations.

What methods does each class have? How (if at all) does this differ between the two implementations?
All three classes have def initialize and class Order has an additional method - Order#total_price in both implementations.The difference between implentation A vs B is that in B classes CartEntry and ShoppingCart have #price. In implementation B the codes for Order#total_price are different than in implementation A.

Consider the Order#total_price method. In each implementation:
  Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
  More logical to compute the price to lower level classes. Implementation A's Order#total_price knows too much about CartEntry's instance variables in order to calculate total price.

  Does total_price directly manipulate the instance variables of other classes?
  It does in Implementation A, which loops through the entries from ShoppingCart and knows that each CartEntry have instance variables @unit_price and @quantity in order to calculate the total price.

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
Would have to add a constant variable like DISCOUNT and set the discount rate. Then would have to add code to check quantity of an item to set threshold of when discount rate will be applied (when quantity > 50? >100?).
Implementation B would be the easier one to modify. The new code can be written in CartEntry#price. Implementation A would be harder because price calculation is only done in Order#total_price. Would have to check if quantity meets bulk threshold for discount in the loop method and it would couple Order and CartEntry even more.

Which implementation better adheres to the single responsibility principle?
Implementation B because each class doesn't know too much about the other classes. ShoppingCart#price knows about CartEntry#price and Order#total_price knows about ShoppingCart#price, but they're not too closely coupled. However, Implementation A's Order#total_price knows too much about CartEntry by knowing its instance variables - @unit_price and @quantity.

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
Implementation B because Order#total_price doesn't have to know the unit price and quantity of each item from CartEntry like in implementation A.


-----Hotel Redesign Activity-----
My original thought was needing to move some methods from Reservation to BookingManager, such as:
-----------
Wave 1
Access the list of all of the rooms in the hotel - Stays in BookingManager

Make a reservation of a room for a given date range - Stays in Reservation

Access the list of reservations for a specific date(track reservations by date) - Move from Reservation to BookingManager. Would be an improvement because it makes more sense to have this function in  
BookingManager because it holds all the booked reservations for the hotel.

Get the total cost for a given reservation - Move from Reservation to BookingManager. 

Raise exception when an invalid date range is provided - Move from DateRange to Reservation because reservation can't be make if date range given is invalid.
-----------

and also take out the DateRange and move the ArgumentError there to Reservation#make_reservation; however, after working on the first part while trying to recycle my codes, the whole design is something I'll have to raze to the ground and start anew. This is something I'll have to work with my tutor on revisiting and getting a better grasp of where my logic went off the rails and how to correct it going forward. The only thing I was able to accomplish was taking out DateRange.