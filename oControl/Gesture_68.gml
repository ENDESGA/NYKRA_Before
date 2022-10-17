dragging = 3;

drag_x = -1;
drag_y = -1;

var isFlick = event_data[?"isflick"];
if (isFlick) {
	drag_xv = event_data[?"diffX"];
	drag_yv = event_data[?"diffY"];
} else {
	drag_xv = -1;
	drag_yv = -1;
}