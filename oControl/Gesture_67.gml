dragging = 2;

drag_x = reach_tween(drag_x,event_data[?"posX"],1.5);
drag_y = reach_tween(drag_y,event_data[?"posY"],1.5);

drag_xv = reach_tween(drag_xv,event_data[?"diffX"],1.5);
drag_yv = reach_tween(drag_yv,event_data[?"diffY"],1.5);