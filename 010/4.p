FOR EACH customer  NO-LOCK,
         EACH order OF customer NO-LOCK,
         EACH orderline OF order NO-LOCK by customer.name:                                                  
         DISP customer.custnum customer.NAME customer.state order.ordernum orderline.Linenum orderline.Price WITH WIDTH 600.
END.

   
