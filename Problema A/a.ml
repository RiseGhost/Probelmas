(*Professor Simão este trabalho é nosso a45968 disciplian de PF - 03/04/2022 21:30*)

(*ocamlfind ocamlopt -linkpkg -package zarith -package str -package unix a.ml -o a && time ./tp*)
let count = ref 0 (*-> Endereço de memória onde fica guadado o número de chamadas da função*) 
let rec schroder x =
  count :=  !count + 1;
  if x = 0. then
  1.
  else
  if x = 1. then
  2.
  else
    ( ((6.*.x -. 3.) *. schroder (x -. 1.)) -. ((x -. 2.) *. schroder (x -. 2.) ) ) /. (x +. 1.)

let s x = 
  int_of_float ( schroder (float_of_int (x)) )

let y =  ref 0 (*Endereço de memória utilizado como variável auxiliar para efetuar a soma*)
let rec schroder1 x = 
  y := 0;
  count := !count + 1;
  if x = 0 then
    1
  else
    if x = 1 then
      2
    else
          (for i = 1 to (x - 2) do
            y := schroder1 i * schroder1 (x-i-1) + !y
          done;
          3 * schroder1 (x-1) + !y)

open Z

(*Z.big_int = schroder3 x*)
let ss = ref []
let rec schroder3 x =
  if x = Z.of_float 0. then
    ss := Z.of_float 1. :: !ss
  else
  if x = Z.of_float 1. then
    ss := Z.of_float 2. :: !ss
  else
    ss := ( ((Z.of_float 6. * x - Z.of_float 3.) * (List.nth !ss 0)) - ((x - Z.of_float 2.) * (List.nth !ss 1) ) ) / (x + Z.of_float 1.) :: !ss;
  List.nth !ss 0

let () = 
    for i = 0  to 10000 do
      print_string ("Schroder");
      print_int (i);
      print_string (" -> ");
      print_string ( Z.to_string ( schroder3 ( Z.of_int i ) ) );
      print_newline();
    done;
