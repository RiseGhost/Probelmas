open Printf

let count = ref 0 
let rec schroder x =
  count := !count + 1;
  if x = 0 then
  1
  else
  if x = 1 then
  2
  else
  int_of_float((((6.*.(float_of_int(x)-.2.) +. 9.)/.(float_of_int(x)+.1.))*.float_of_int(schroder(x-1))) -. (((float_of_int(x)-.2.)/.(float_of_int(x)+.1.))*.float_of_int(schroder(x-2))))
  (* Printf.printf "%d" count *)

(*5+4+3+2+1 + 4+3+2+1*)

let y =  ref 0
let rec schroder1 x = 
  y := 0;
  count := !count + 1;
  if x = 0 then
    1
  else
    if x = 1 then
      2
    else
      if x = 2 then
        3 * schroder1 (x-1)
      else
        (
          for i = 1 to (x - 2) do
            y := schroder1 i * schroder1 (x-i-1) + !y
          done;
          3 * schroder1 (x-1) + !y
        )
        


let () = 
    for i = 1  to 22 do
      print_string ("Schroder ");
      print_int (i);
      print_string ("->");
      print_int (schroder i);
      print_string (" ->");
      print_int !count;
      print_newline ();
      count := 0;
      print_string ("Schroder1 ");
      print_int (i);
      print_string ("->");
      print_int (schroder1 i);
      print_string (" ->");
      print_int !count;
      print_newline ();
      count := 0
    done;
