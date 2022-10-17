
display_text = "";

__text = real_string(text);
ini_language();
TEXT = ini_read_string("NOTES","note["+string(__text)+",0]","");
top_t = ini_read_string("NOTES","note["+string(__text)+",1]","");
align = real_string(ini_read_string("NOTES","note["+string(__text)+",2]",""));
ini_close();
draw_set_font(FONT_MAIN);
var __t = "", n_line = 0, p_chr = "", _chr = "";
var _tvar = "";
var _shake = 0, _waveh = 0, _wavev = 0, _colour = -1;
for(var i=1; i<=string_length(TEXT+" "); i++) {
	_chr = string_char_at(TEXT,i)
	if _chr=="~" {
		n_line += 1;
		__t = "";
		_chr = "";
	};
	if p_chr==" " && (string_width(__t+"mmmmmm")/2)>=(82) {
		for(var j=1; j<10; j++) {
			if (string_width(__t+_tvar)/2)>(82) {
				n_line += 1;
				__t = "";
				break;
			}
			else
			{
				_tvar += string_char_at(TEXT,i+j);
				if string_char_at(TEXT,i+j)==" " {
					break;
				};
			};
		}
	};
	__t += _chr;
	p_chr = _chr;
	if n_line>0 {display_text += "\n"; n_line=0;};
	display_text += _chr;
}