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

	string list = ["Casa de putas"; "Mariana = puta"; "Aldeia da puta"]
