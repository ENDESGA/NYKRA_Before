ini_language();
	for (var i = 0; i < 100; ++i) {
		book_desc[@ i,0] = ini_read_string("BOOKS","book["+string(i)+",1]","");
		book_desc[@ i,1] = ini_read_string("BOOKS","book["+string(i)+",3]","");
		book_desc[@ i,2] = ini_read_string("BOOKS","book["+string(i)+",4]","");
		book_desc[@ i,3] = round(real_string(ini_read_string("BOOKS","book["+string(i)+",0]","")));
		if book_desc[@ i,0]=="" break;
	};
ini_close();