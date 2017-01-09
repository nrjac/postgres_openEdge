define temp-table ttorder like order.
define temp-table ttorderline like orderline.

define dataset dorder for ttorder,ttorderline
  data-relation d1 for ttorder,ttorderline relation-fields(ordernum,ordernum).

empty temp-table ttorder.
empty temp-table ttorder.

define data-source srcOrder for order.
define data-source srcorderline for orderline.

buffer ttorder:attach-data-source(data-source srcorder:handle).
buffer ttorderline:attach-data-source(data-source srcorderline:handle).

data-source srcOrder:FILL-WHERE-STRING = "WHERE order.ordernum = 1 ".

dataset dorder:fill().

for each ttorder no-lock:
  disp ttorder.
end.

for each ttorderline no-lock:
  disp ttorderline.
end.
