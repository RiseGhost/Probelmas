# Ocaml Lists:
![](https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_ocaml_icon_130288.png)

Neste documento irei dar alguns exemplos de funções para fazer manipulação de listas em __Ocaml__. Assim como mostrar algumas das ferrementas que o Ocaml disponibiliza para a sua manipulação.

### Criação de uma lista:
Em Ocaml assim como noutras linguagem é possível a criação de lista de vários tipos. Como por exemplo uma lista de inteiro, de caracteres, strings, ou outro tipo de estruturas criadas pelo utilizador da linguagem. 

As listas são compostas por uma série de apontadores, apontando para endereços de memória onde são guardados os dados de cada posição.

Por exemplo o código a baixo exemplifica como criar uma lista vázia.
```ocaml
let list = []
```

Para criar uma lista com os elementos 4, 5, 10, 15, 67 posso fazer da seguinte maneira:
```ocaml
let list = [4; 5; 10; 15; 67]
```

Para criar uma lista com a letras: f, w, z posso fazer da seguinte maneira:
```ocaml
let list = ["f";"w";"z"]
```

Para criar uma referência de uma lista, basca colocar a palavara ref atrás:
```ocaml
let list = ref [80;76;566;9000]
```

### Junção de Listas:
O Ocaml entrega um operador que premite fazer a junção de lista de maneira fácil. Para tal basta usar __@__ entre duas lista para obter a junção delas.

Por exemplo se quiser juntar a lista [7;4;10] com a que tem [0,8] basta fazer:
```ocaml
[7;4;10] @ [0;8]
```
O output será a seguinte lista:

	int list = [7; 4; 10; 0; 8]

Também é possivél juntar listas composta por char ou string.
Por exemplo se quiser juntar a lista ["Bom"] com a lista ["dia"] basta fazer:
```ocaml
["Bom"] @ ["dia"]
```
O output será a seguinte lista:

	string list = ["Boma"; "dia"]

### Ordenar uma lista em ordem crescente:
Em Ocaml para ordenar uma lista por ordem crescente é bastante simples graças ás facilidades dadas pela linguagém. É possivél o fazer com uma lista de inteiros ou de char.

Por exemplo para ordenar uma lista de inteiros:
```ocaml
let list = [-1;5;980;76;6;10]

List.sort compare list
```
O output dado pelo __List.sort__ será:

	int list = [-1; 5; 6; 10; 76; 900]

Para ordenar uma lista de char é bastante parecido:
```ocaml
let list = ["b"; "m"; "z"; "c"; "a"; "x"]

List.sort compare list
```	
O output dado pelo __List.sort__ será:

	string list = ["a"; "b"; "c"; "m"; "x"; "z"]

### Aceder a um elemento numa determinada posição de uma lista:
Se quiser ober o elemento da posição __index__ de uma lista __L__ em Ocaml basta fazer __List.nth L index__

Por exemplo se quiser imprimir o elemento na 3 posição:
```ocaml
let list = [5; 34; 90; 456; 789; 23; 45]

print_int(List.nth list 3)
```
O output será:

	456

### Obter a somar de todos os elementos de uma lista:
Para tal fim irei criar uma função recursiva que irar receber como argumento uma lista de inteiros e irá returna um inteiro se será a soma de todos os elementos da lista.

Para tal ela irá precurer a lista toda elemento a elemento somando o elemento atual ou o próximo elemento. Quando não houver mais elementos na lista ela retorna zero.

```ocaml
let list = [5; 34; 90; 456; 789; 23; 45]

let rec soma l =
	match l with
	|[] -> 0
	|x::y -> x + soma y;;

soma list
```
O valor de __soma list__ será:

	int = 1442

### List.map
O Ocaml oferece uma poderosa ferrementa para aplicar funções a uma lista.
O __List.map__ recebe como 1º argumento a função e como 2º argumento a lista e retorna uma lista que resulta da aplicação da função sobre a lista.


Por exemplo se quiser obter uma lista com o mesmo tamanho de uma lista original, mas com todos os elemento elevados ao quadrado. Posso usar o seguinte código.
```ocaml
let square x = x * x;;

let list = [2;1;5;6;9;8;10]

List.map square list
```
O output do __List.map square list__ será:

	int list = [4; 1; 25; 36; 81; 64; 100]

Uma alternativa ao código de cima seria:
```ocaml
List.map ( fun x -> x * x ) [2;1;5;6;9;8;10]
```

O output do __List.map__ também será:

	int list = [4; 1; 25; 36; 81; 64; 100]

Também posso usar o __List.map__ para adicinar uma determinada string a todas as posições de uma lista de strings. Por exemplo:
```ocaml
let letras = ["Casa de "; "Mariana = "; "Aldeia da "];;

let add x = x ^ "puta";;

List.map add letras
```
O output do __List.map__ será:

	string list = ["Casa de puta"; "Mariana = puta"; "Aldeia da puta"]

### Devolver uma lista só com os elementos pares:
O objetivo desta função é dado uma lista de inteiros devolver uma lista que contêm apenas o elementos pares.
Para tal vamos utilizar o seguinte código:
```ocaml
let list = [3; 4; 10; 80; 7; 1; 34; 37];;

let rec even l =
	match l with
	|[] -> []
	|x::y ->
		(
		if x mod 2 = 0 then
			x::even y
		else
			even y
		);;

even list;;
```
O output da função __even__ será:

	int list = [4; 10; 80; 34]

### Inverter uma lista:
#### Sem utilizar o List.rev:
A necessidade de inversão de uma lista pode ocorrer em vários momentos ao longo do precurso de vida um programador. Por isso ter uma função que nos ajude com isso não em seria nada mau. Em Ocaml essa função pode ser bastante simples assim como pode ser visto no exemplo a baixo:

```ocaml
let reverse list =
	let a = ref [] in
	for i = 0 to (List.length list - 1) do
		a := (List.nth list i) :: !a
	done;
	!a;;

reverse [45;4;90;167;2];;
``` 
O output da função __reverse__ será:

	int list = [2; 167; 90; 4; 45]

Essa função cria uma referência para uma lista __a__ auxiliar onde irá colocar o valores. Ela coloca sempre o valor que esta na posição i da lista __list__ na primeira posição da lista __a__ empurrando o elemento que anteriormente estava na primeira posição para a segunda, o que estava na segundo para a terceira e por ai sucessivamente. Essa função também funciona para lista de outros tipos como de strings, etc...

#### Utilizando o List.rev:
O Ocaml já disponibiliza uma função que faz o mesmo que o exemplo de cima, sendo bastante fácil de usar. Bastando apenas passar a lista que quer inverter.

Por exemplo se quiser inverter a list [10;5;2;-2;0]:
```ocaml
List.rev [10;5;2;-2;0]
```
O resultado obetido será:

	int list = [0; -2; 2; 5; 10]

Também é possivel fazer com lista de outro tipos primitivos, por exemplo uma lista de string.
```ocaml
List.rev ["z";"m";"t";"Youtube"; "A"; "UBI"]
```
O resultado obetido será:

	string list = ["UBI"; "A"; "Youtube"; "t"; "m"; "z"]

### Obter o maior elemento de uma lista:
Para obter o maior elemento de uma lista irei utilizar dois algoritmos. Um deles feito com as funções fornecidas pelo Ocaml e outro mais generico que pode ser aplicado noutras linguagens.

```ocaml
let bigger list = 
	List.nth (List.rev (List.sort compare list)) 0
```

```ocaml
let bigger list =
	let maior = ref (-9999) in
	for i = 0 to List.length list - 1 do
	if List.nth list i > !maior then
		maior := List.nth list i
	else
		maior := !maior
	done;
	!maior;;
```

Passando como argurmento a lista [4; 5; -2; 90; 6; 56] as duas função retorna o mesmo output

	int = 90

### Obter o menor elemento de uma lista:
Como fiz no caso de cima, aqui tembém irei apresentar duas soluções uma usando as funções do Ocaml e outra um caso mais genérico.

```ocaml
let smaller list =
	List.nth (List.sort compare list) 0
```

```ocaml
let smaller list = 
	let menor = ref 99999 in
	for i = 0 to List.length list - 1 do
		if List.nth list i < !menor then
			menor := List.nth list i
		else
			menor := !menor
	done;
	!menor;;
```

Passando como argurmento a lista [4; 5; -2; 90; 6; 56] as duas função retorna o mesmo output

	int = -2

### Obter uma lista só com os elementos nas posições pares:
Em cima já construir uma função que devolve uma lista com os elementos pares, mas desta vez irei fazer uma função que devolve os elementos nas posições pares.
__[0,1,2,3,4,5] -> [0,2,4]__

```ocaml
let rec even_index list =
	match list with
	|[] -> []
	|x::[] -> [x]
	|x::y::t -> x::even_index t;;
```
O output de __even_index [9;5;7;90;1]__ será:

	int list = [9; 7; 1]

### Obter uma lista só com os elementos nas posições impares: 
Bastante parecido com o algoritmo de anterior mas desta vez para as posições impares.
__[0,1,2,3,4,5] -> [1,3,5]__

```ocaml
let rec odd_index list =
	match list with
	|[] -> []
	|[_] -> []
	|x::y::t -> y::odd_index t
```
O output da __odd_index [9;5;7;90;1]__ será

	int list = [5; 90]

### List.combine:
O List.combine premite ao utilizador combinar duas lista numa só lista.
Imagine o seguinte cenário: <p>
Está a guardar os valores da sequência de fibonacci numa lista de maneira que na posição n da lista fica o valor de fibonacci n. E tem outra lista onde estar a guardar os valores de n. E você quer combinar essa duas lista numa nova lista sendo para cada posição n da lista ela irá conter (n, fibonacci n).

```ocaml
let rec fibonacci n =
	if n < 2 then
		n
	else
		fibonacci (n - 1) + fibonacci (n - 2);;

let fibo = ref [];;
let n = ref [];;

for i = 0 to 25 do
	fibo := !fibo @ [fibonacci i];
	n := !n @ [i]
done;;

let combine = List.combine !n !fibo;;
```
O valor de __!fibo__ será: 
	
	int list = [0; 1; 1; 2; 3; 5; 8; 13; 21; 34; 55; 89; 144; 233; 377; 610; 987; 1597; 2584; 4181; 6765; 10946; 17711; 28657; 46368; 75025]

O valor de __!n__ será:

	int list = [0; 1; 2; 3; 4; 5; 6; 7: 8; 9; 10; 11; 12: 13; 14; 15; 16; 17; 18; 19: 20; 21; 22; 23; 24; 25]

O valor de __combine__ será:

	(int * int) list = [(0, 0); (1, 1); (2, 1); (3, 2); (4, 3); (5, 5); (6, 8); (7, 13); (8, 21); (9, 34); (10, 55); (11, 89); (12, 144); (13, 233); (14, 377); (15, 610); (16, 987); (17, 1597); (18,2584); (19,4181); (20,6765); (21,10946); (22, 17711); (23, 28657); (24, 46368); (25, 75025)]

### List.split:
Têm o efeito inverso do List.combine. <p>
```ocaml
('a * 'b) list -> 'a list * 'b list =  <fun>
```
Por exemplo:
```ocaml
List.split [(1, "um");(2, "dois");( 3, "três");(4, "quarto")]
```
O output será:

	int list * string list = ([1; 2; 3; 4], ["um", "dois", "três", "quarto"])
