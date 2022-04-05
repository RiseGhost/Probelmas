# O que podes encontrar aqui❓:
Esta pasta foi criada na âmbito de alocar o 1º trabalho realizado na disciplina de __Programação funcional__ e foi selecionada __Ocaml__ como linguagem de programação. O enunciado do problema assim com as formulas matemáticas utilizadas podem ser encontrado dentro do ficheiro __Problema A__. Devido a necessidade de trabalhar com valores enormes, nós tevimos de utilizar uma livraria de precisão arbitária, nós escolhemos a __Zarith__ para isso.

## Como está organizado o código: 🧑‍💻
- __Count__ 🔢 -> endereço de memória que é utilizado para contar o número de vezes que uma função foi chamada;
- __Schroder__ 📐 -> responsável por fazer o calculo da sequência de Schroder. Para tal foi implementada nela a formula matemática que não utiliza somatórios.
- __S__ 📇 -> a sua única função é converter o input que recebe para um float e converter o output da função __schroder__ para um inteiro.
- __Schroder1__ 📐 -> responsável por fazer o calculo da sequência de Schroder. Para tal foi implementada nela a formula matemática que utiliza somatórios.
- __()__ -> função principal, representa o papel de uma função main. É reponsável por imprimir os outputs. Dentro dele há um cilco for responsável por calculo a sequência para valores muito grandes, para isso foi utilizada uma lista.
- __open Z__ -> abretura da biblioteca Zarith.


## Função schroder:
Antes de aplicar a sequência no código nós escolhemos fazer umas pequenas alterações na formula. Assim sendo a baixo tento explicar as alterações efetuadas.
![IMG_1925](https://user-images.githubusercontent.com/91985039/161840676-70a77877-23e0-44c0-bf23-71e5e7cd354b.jpg)
![IMG_1926](https://user-images.githubusercontent.com/91985039/161840695-d23a020a-c5c6-41cc-9389-7ee55ef067c4.jpg)