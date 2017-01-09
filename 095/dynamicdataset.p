define variable hDset as handle no-undo.
define variable hRel  as handle no-undo. 

define temp-table ttorder like order.
define temp-table ttorderline like orderline.

create dataset hDset. 

hDset:set-buffers(buffer ttOrder:HANDLE, buffer ttOrderLine:HANDLE). 

hRel = hDset:add-relation(buffer ttOrder:HANDLE, buffer ttOrderLine:HANDLE,  "OrderNum,OrderNum").

define data-source srcOrder for order.
define data-source srcorderline for orderline.

buffer ttorder:attach-data-source(data-source srcorder:handle).
buffer ttorderline:attach-data-source(data-source srcorderline:handle).

data-source srcOrder:FILL-WHERE-STRING = "WHERE order.ordernum = 1 ".

hDset:fill().

for each ttorder no-lock:
  disp ttorder.
end.

for each ttorderline no-lock:
  disp ttorderline.
end.
