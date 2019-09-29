-----Activity: Evaluating Responsibility-----
Prompts:
What classes does each implementation include? Are the lists the same?
Both implementations contain the same classes: CartEntry, ShoppingCart and Order.

Write down a sentence to describe each class.
CartEntry: Knows about the unit price and quantity of an item the shopper wants to purchase.
ShoppingCart: Knows all the items the shopper wants to purchase.
Order: Knows the total cost of the items the shopper wants to purchase in their shoppping cart.

How do the classes relate to each aother? It might be helpful to draw a diagram on a whiteboard or piece of paper.
Order.cart makes an instance of ShoppingCart and takes all the items within the shopping cart to calculate the total price (incl. sales tax) of the order. Order has a One-to-One relationship with ShoppingCart.
ShoppingCart.entries can contain an array of CartEntry objects by having instances of CartEntry shoveled/pushed into the @entries array. ShoppingCart has a One-to-Many relationship with CartEntry.

What data does each class store? How (if at all) does this differ between the two implementations?
CartEntry: @unit_Price, @quantity
ShoppingCart: @entries
Order: @cart
The data in each class did not differ between the two implementations.

What methods does each class have? How (if at all) does this differ between the two implementations?
All three classes has def initialize and class ORder has an additional method - Order#total_price in both implementations.
The difference between implementat A vs B is that in B, classes CartEntry and ShoppingCart have the price method. In implementation B, the codes for Order#total_price are different than in implementation A.

Consider the Order#total_price method. In each implementation:
  Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
  It's more logical to compute the price in the lower level classes. Implementation A's Order#total_price knows too much about CartEntry's instance variables in order to calculatee the total price

  Does total_price directly manipulate the instance variables of other classes?
  It does in Implmentation A, which loops through the entries from ShoppingCart and knows about CartEntry.unit_price and CartEntry.quantity in order to make the calculation.

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
Would have to add a constant variable like DISCOUNT and set the discount rate. Then would have to add code to check quantity of an item meets the bulk threshold in order to aplly the discount rate.
Implementation B would be the easier one to modify because the new code can be added to CartEntry#price. Whereas Implementation A would be harder because price calculation is only done in Order#total_price. This means the method would also have to check if quantity meets the bulk threshold for the discount to apply and it tightens the coupling between Order to CartEntry.

Which implementation better adheres to the single responsibility principle?
Implementation B adheres better because each class doesn't know too much about the other classes and not tightly coupled as implementation A, in which Order#total_price knows too much about CartEntry and its instance variables @unit_price and @quantity.

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
Implementation B because in implementation A, Order#total_price knows ShoppingCart contains entries from CartEntry and in order to calculate the total, it has to know about CartEntry.unit_price and CartEntry.quantity.


-----Hotel Redesign Activity-----
My original plan for the redesign is to move some functions from Wave 1 that were made in Reservation to BookingManager: 

Access the list of all the rooms in the hotel - Stays in BookingManager
Make a reservation of a room for a given date range - Stays in Reservation
Access the list of reservatinos for a specific date - Move from Reservation to BookingManager
Get total cost for a given reservation - Move from Reservation to BookingManager
Raise exception when an invalid date range is provided - Move from DateRange to Reservation and delete DateRange


However, upon trying to rework the Reservation class it became clear it would require starting from scratch and a complete rebuild of the entire project. So, the refactoring I can execute with the code I do have, is take out DateRange and move the invalid date range ArgumentError into Reservation#make_reservation. From the requirments in Wave 1 and 2, having a DateRange class isn't necessary since it makes since to raise the ArgumentError in the make_reservation method. Having DateRange is more anticipatory of need that hasn't come presented itself.

Regarding the reconstruction of my Hotel project, the following is what I have in mind:
class Reservation
  def initialize: @reservation #Hash with room numbers as key and value as array
  display_room method #shows all rooms available in hotel
  make_reservation method 
    #raise ArgumentErrors for invalid date range
    #make instance of Booker which contains guest's phone number (use as reservation id), check in date and check out date
    #calls on available_rooms method to check new reservation's date range is available
    #if available: make reservation and shovel/push it into @reservation
    #if not available: raise ArgumentError that no room is available for given date range
  list_reservation method #list all reservations for a given date range
  available_rooms method #list all available rooms for a given date range
  find_reservation method #find a given reservation. Will find by id# which is the phone number of the guest
  total_cost method #calculates total cost of a reservation

class Booker
  def initialize(phone_num, check_in, check_out)
    #phone_num is guest's phone number that will act as the reservation's id number
    #check in and check out date of the reservation
  total_cost method #calculates total cost of a reservation before booking
    #may seem redundant to have this method in two classes but I think it's still acceptable under SRP
