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

Por exemplo que quiser juntar a lista [7;4;10] com a que tem [0,8] basta fazer:
```ocaml
[7;4;10] @ [0;8]
```
