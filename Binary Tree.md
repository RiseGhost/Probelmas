# Binary trees Ocaml:
![](https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_ocaml_icon_130288.png)

Neste documento irei tentar explicar como criar árvores binárias em Ocaml, assim como manipular.

### Criação da estrutura da árvore:
Ás árvores são contituidas por várias __Nodos__ que por sua vez são constituidos por um __elemento__ que pode ser qualquer coisa, tipo um inteiro, uma string, uma lista, uma árvere binária ou qualquer outro tipo de dado ou estrutura de dados. E para cada elemento há mais dois "apontadores" para mais dois Nodos, um há direita e outro a esquedra.

Em Ocaml a sua represtanção é algo do tipo:
```ocaml
type 'a tree =
	Node of 'a tree * 'a * 'a tree
	| Leaf;;
```

No exemplo de cima:
- 'a tree -> apontador para outro Nodo;
- 'a -> elemento em si

A Ordem que como é definida por ser alterado, mas caso isso seja feito, depois também é necessário o alterar nas funções ao longo deste documento.

### Adicionar elementos a uma árvore binária:
Utilizando a árvore binária defina em cima agora irei apresentar uma possivél função capaz de adicionar elementos a ela.

```ocaml
let rec add x = function
	|Leaf -> Node(Leaf, x, Leaf)
	|Node (l, v, r) as t ->
		if x = v then t
		else if x < v then Node(add x l, v, r)
		else Node(l, v, add x r);;
```

Ela verefica que o elemento dado é igual ao valor daquele nodo, se sim ela devolve a árvore em si, visto que só pode haver uma vez um dado elemento em toda a árvore. Se for maior é vai para a direita e se menor ela vai para esquedra até chegar a uma folha, quando chega ela adiciona um novo Nodo contendo o elemento passado como argumento e duas folhas.

__Outro possível algoritmo para adicionar valores a uma árvore:__
```ocaml
let rec add x tree =
	match tree with
	|Leaf -> Node(Leaf, x, Leaf)
	|Node(l,v,r) ->
		if x = v then tree
		else if x < v then Node(add x l, v, r)
		else Node(l, v, add x r)
```

Por exemplo: (o exemplo é igual para os dois algoritmos)

```ocaml
let g = Node(Leaft, 4, Leaft);;
let g = add 6 g;;
let g = add 2 g;;
```

![](https://user-images.githubusercontent.com/91985039/178030476-5de2a154-e025-4a77-84f7-60d6c1c233f2.jpeg)

### Imprimir os valores da árvore binária:
Irei apresentar um algortimo capaz de imprimir a árvore binária a cima defenida.
Quando não houver mais nenhum elemento a baixo ele irá imprimir zero, caso contrário imprime __Node "valor do Nodo"__.

```ocaml
open Printf

let rec print_tree t =
	march t with
	|Leaft -> Printf.printf "0\n"
	|Node(l, v, r) ->
		Printf.printf "Node %d\n" v;
		print_tree l;
		print_tree r;;
```

A impressão da árvore g de cima será algo do tipo:

	Node 4
	Node 2
	0
	0
	Node 6
	0
	0

### Obter o menor elemento de uma árvore binária:
Numa árvore binário o menor elemento será o elemento mais a esquedra possível.
Então o algoritmo que irei apresentar irá precorrer a árvore binária indo sempre para a esquedra até encontrar uma folha quando a encontrar devolve o elemento anterior a essa folha.

```ocaml
let rec smaller_element = function
	|Leaf -> 0
	|Node(l, v, r) ->
		if smaller_element l = 0 then
			v
		else
			smaller_element l;;
```

O output de __smaller_element g__ será

	int = 2

### Obter o maior elemento de uma árvore binária:
Muito semelhante ao de cima mas desta vez o maior elemento é o elemento mais a direita possivél. Quanto a função encontrar um folha a direita ela devolve esse valor.

```ocaml
let rec biggest_element = function
	|Leaf -> 0
	|Node(l, v, r) ->
		if biggest_element r = 0 then
			v
		else
			biggest_element r;;
```

O output de __biggest_element g__ será:

	int = 6

### Obter uma lista com todos os elementos de uma árvore binária:
Agora irei apresentar um algoritmo capaz de obter uma lista de uma árvore binária.	 Ele irá começar pelo elemento mais a esquedra e mais baixo possivel até o elemento mais a direita possivél.

```ocaml
let rec tolist = function
	|Leaf -> []
	|Node(l,v,r) -> tolist l @ [v] @ tolist r;; 
```

O output de __tolist g__ será:

	int list = [2; 4; 6]

### Procurar um elemento numa árvore binária:
O algoritmo seguinte procura um dado elemento numa árvore binária, se o encontrar devolve __TRUE__ se não o encontrar devolve __FALSE__.

```ocaml
let rec search value = function
	|Leaf -> false
	|Node(l,v,r) ->
		if value = v then
			true
		else if value > v then
			search r
		else
			search l;; 
```

O output de __search 6 g   e    search 50 g__ são respetivamente:

	boolean = true
	boolean = false

### Obter o número total de elementos de uma árvore binária:
O algoritmo precorre o lado esquedro e depois precorre o lado direito da árvore e soma 1 para cada elemento visto quando chega a um Nodo vazio ele soma 0.

```ocaml
let rec number_element = function
	|Leaf -> 0
	|Node(l,v,r) ->
		1 + element_number l + element_number r;;
```
O output da função __number_element g__ será:

	int = 3

### Obter o número de elementos pares de uma árvore binária:
O algoritmo baixo precorre todos o elementos da árvore binária se um valor do Nodo onde ele esta naquele momento for par soma 1 e passa para o seguinte se não, passa somente para o seguinte.
```ocaml
let rec even = function
	|Leaf -> 0
	|Node(l, v, r) ->
		if v mod 2 = 0 then
			1 + even l + even r
		else
			even l + even r;;
```
O output de __even g__ será:

	int = 3

### Obter uma lista com todos os valores pares de uma árvore binária:
O algoritmo seguinte vai devolve uma lista com todos os valores pares de uma árvore binária, começando pelo valor mais a esquedra possivél até ao valor mais a direita possivél.
```ocaml
let rec even_list = function
	|Leaf -> []
	|Node(l,v,r) ->
		if v mod 2 = 0 then
			even_list l @ [v] @ even_list r
		else
			even_list l @ even_list r;;
```
O output de __even_list g__ será:

	int list = [2; 4; 6]

### Obter o número de folhas de uma árvore binária:
O algoritmo seguinte devolve um inteiro que é o número total de folhas que a árvore contém.

```ocaml
let rec leaves = function
	|Leaf -> 0
	|Node(l, v, r) ->
		if leaves l = 0 && leaves r = 0 then
			1
		else
			leaves l + leaves r;; 
```
O output de __leaves g__ será:

	int = 2

### Obter a altura de um árvore binária:
O algoritmo a seguir precorre a árvore binária até as folhas e devolve a maior distância.

```ocaml
let rec height = function
	|Leaf -> -1
	|Node(l,v,r) -> 1 + max (height l) (height r);;
```
Para a árvore binária inicial o algoritmo irá retorna:

	int = 1

![](https://user-images.githubusercontent.com/91985039/178117470-cde5dd2f-4ded-4712-a411-0e7982a8c1bf.jpeg)

Para uma árvore um pouco maior tipo a seguinte:
```ocaml
let g = Node(Leaf, 4, Leaf)
let g = add 6 g;;
let g = add 2 g;;
let g = add 7 g;;
let g = add (-5) g;;
let g = add (-3) g;;
let g = add (-10) g;;
let g = add 15 g;;
let g = add 50 g;;
```
O output será:

	int = 4

![](https://user-images.githubusercontent.com/91985039/178117467-3c9fa2e2-30c3-40f6-833c-a08bf5172669.jpeg)

### Obter a soma de todos os elementos de um árvore binária:
O algoritmo a baixo precorre a árvore toda e soma o elemento do Nodo atual com os elementos dos Nodos a esquedra e dos Nodos a direita.

```ocaml
let rec soma = function
	|Leaf -> 0
	|Node(l,v,r) -> v + soma l + soma r;;
```
O output de __soma g__ será:

	int = 12
