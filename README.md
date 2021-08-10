Esse código foi desenvolvido para a disciplina: Simulação de reservatórios de petróleo.
Resultado do estudo da linguagem MATLAB e aplicado neste projeto.

Esse programa resolve o problema de Buckley-Leverett para o caso de fluxo unidimensional 
adotando um método upwind de alta ordem para aproximar a solução do campo de saturação.
Foram testadas 2 funções limitadoras: Van Albada e Minmod.

* MVF.m é o arquivo principal que deverá ser executado.

* SolIni.m é o arquivo que contém a solução inicial do problema.

* BL_Semi_Analitic_Solution.m é a solução semi-análitica do problema. 

* FluxNum.m é a função que resolve o fluxo numérico.

* VanAlbada.m e minmod.m são as funções limitadoras do fluxo.

* funflux.m é onde é definido a função de fluxo, podendo ser adotado os fluxos de burgers, buckley-leverett ou fluxo linear.

* meth.m é a função na qual foram implementados os métodos de solução e as condições iniciais e de contorno.

