let rec s x =
  if x = 0 then
  1
  else
  if x = 1 then
  2
  else
  int_of_float((((6.*.(float_of_int(x)-.2.) +. 9.)/.(float_of_int(x)+.1.))*.float_of_int(s(x-1))) -. (((float_of_int(x)-.2.)/.(float_of_int(x)+.1.))*.float_of_int(s(x-2))))


let () = 
    for i = 1  to 25 do
      print_string ("S");
      print_int (i);
      print_string ("->");
      print_int (s i);
      print_newline ()
    done