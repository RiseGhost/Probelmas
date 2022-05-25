open Printf

type 'a tree =
  Node of 'a * 'a tree * 'a tree * int
  | Leaf of int;;

let altura = function
  | Leaf int -> 0
  | Node (_,_,_,h) -> h

let node v l r = Node (v, l, r, 1 + max (altura l) (altura r))

let balance v l r =
  let hl = altura l in
  let hr = altura r in
  if hl > hr + 1 then begin
    match l with
    | Node (lv, ll, lr, _) when altura ll >= altura lr -> node lv ll (node lv lr r)
    | Node (lv, ll, Node (lrv, lrl, lrr, _), _) -> node lrv (node lv ll lrl) (node v lrr r)
    | _ -> assert false
  end else if hr > hl + 1 then begin
    match r with
    | Node (rv, rl, rr, _) when altura rr >= altura rl -> node rv (node v l rl) rr
    | Node (rv, Node(rlv, rll, rlr, _), rr, _) -> node rlv (node v l rll) (node rv rlr rr)
    | _ -> assert false
  end else
    node v l r

let rec add x = function
| Leaf int -> Node (x, Leaf int, Leaf int, 1)
| Node (v, l, r, _) as t ->
    let c = compare x v in
    if c = 0 then t
    else if c < 0 then balance v (add x l) r
    else balance v l (add x r)

let rec print_tree t =
  match t with
  | Leaf int -> Printf.printf "0\n"
  | Node (v, l, r, _) ->
    Printf.printf "Node %d\n" v;
    print_tree l;
    print_tree r;;

(*Retorna TRUE se o elemento existir na árvore o FALSE se não existir:*)
let rec search tree n =
  match tree with
  | Leaf int -> false
  | Node (k, left, right, _) ->
    if k = n then
      true
    else if n < k then
      search left n
    else
      search right n;;

let rec path t number =
  match t with
  | Leaf int -> []
  | Node (k, left, right, _) ->
    if k = number then
      [k]
    else if number < k then
      k :: path left number
    else
      k :: path right number;;

let rec minino t x y =
  match t with
  | Leaf int -> x
  | Node (k, left, right, _) ->
    if y > k && x > k then
      minino right x y
    else if y < k && x < k then
      minino left x y
    else
      k;;

let list = ref []

let () =
  print_string "Indique o número de árvores: ";
  let treenumber = read_int() in
  for i = 1 to treenumber do
    print_string "Digite o número de elementos: ";
    let elementnumber = read_int() in
    let a = read_int() in
    let g = ref (node a (Leaf 0) (Leaf 0)) in
    for i = 2 to elementnumber do
      let b = read_int() in
      g := add b !g
    done;
    list := !g :: !list;
    (*print_tree !g;*)
  done;;

  print_newline ();
  print_string "Indique os valores que pretende procurar: ";
  let b,a = Scanf.sscanf (read_line ()) " %d %d" (fun a b -> a,b) in

  for i = 0 to (List.length !list) - 1 do
    if search (List.nth !list i) b && search (List.nth !list i) a then
      (print_int (minino (List.nth !list i) b a);
      print_newline())
    else
      (print_string "Este valores não existem";
      print_newline())
  done;;