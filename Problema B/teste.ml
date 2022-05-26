open Printf

type 'a tree =
  Node of 'a tree * 'a * 'a tree * int
  | Leaf;;

let altura = function
  | Leaf -> 0
  | Node (_,_,_,h) -> h

let node l v r = Node (l, v, r, 1 + max (altura l) (altura r))

(*Responsável por fazer o balanciamento da árvore:*)
let balance l v r =
  let hl = altura l in
  let hr = altura r in
  if hl > hr + 1 then begin
  match l with
  | Node (ll, lv, lr, _) when altura ll >= altura lr -> node ll lv (node lr v r)
  | Node (ll, lv, Node (lrl, lrv, lrr, _),_) -> node (node ll lv lrl) lrv (node lrr v r)
  | _ -> assert false
  end else if hr > hl + 1 then begin
  match r with
  | Node (rl, rv, rr, _) when altura rr >= altura rl ->
  node (node l v rl) rv rr
  | Node (Node(rll, rlv, rlr, _), rv, rr, _) -> node (node l v rll) rlv (node rlr rv rr)
  | _ -> assert false
  end else
  node l v r

let rec add x = function
| Leaf -> Node (Leaf, x, Leaf, 1)
| Node (l, v, r, _) as t ->
    let c = compare x v in
    if c = 0 then t
    else if c < 0 then balance (add x l) v r
    else balance l v (add x r)

let rec print_tree t =
  match t with
  | Leaf -> Printf.printf "0\n"
  | Node (l, v, r, _) ->
    Printf.printf "Node %d\n" v;
    print_tree l;
    print_tree r;;

(*Retorna TRUE se o elemento existir na árvore o FALSE se não existir:*)
let rec search tree n =
  match tree with
  | Leaf -> false
  | Node (left, k, right, _) ->
    if k = n then
      true
    else if n < k then
      search left n
    else
      search right n;;

(*Retorna a primeira mutação comun entre x e y:*)
let rec minino t x y =
  match t with
  | Leaf -> x
  | Node (left, k, right, _) ->
    if y > k && x > k then
      minino right x y
    else if y < k && x < k then
      minino left x y
    else
      k;;

let list = ref []
let aux = ref 0

let () =
  let treenumber = read_int() in
  for i = 1 to treenumber do
    let elementnumber = read_int() in
    let a = read_int() in
    let g = ref (node Leaf a Leaf) in
    for i = 2 to elementnumber do
      let b = read_int() in
      g := add b !g;
    done;
    list := !g :: !list;
  done;
  let b,a = Scanf.sscanf (read_line ()) " %d %d" (fun a b -> a,b) in

  for i = 1 to (List.length !list) do
    if search (List.nth !list (List.length !list - i)) b && search (List.nth !list (List.length !list - i)) a then
      (print_int (minino (List.nth !list (List.length !list - i)) b a);
      print_newline())
    else
      aux := !aux + 1
  done;

  if !aux = List.length !list then
    (print_string "NO";
    print_newline())
  else
    aux := 999909;;
