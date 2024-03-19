# Projeto sandbox

* **Sobre Arquitetura**
##
Esse projeto foi desenvolvimento utilizando arquitetura MVVM, visando a separação de responsabilidade e uma possivel modolização caso necessario.

* Sobre o desenvolvimento
##
Foi criado algumas extension e classes "base" para facilitar o desenvolvimento de telas na reutilização de codigo/componente. 

* **Sobre a camada de Service**
##
Na camada de requisição foi utilizado URSession e criado um singleton da classe que gerencia o request afim de garantir uma unica instancia da url,
garantindo um unico ponto de acesso.

* **Sobre o Unit Test**
##
Foi implementado testes unitarios na camda de "negocio" afim de garantir cenarios de "crash" devido a propriedades nulas.

# Libs

* Sem libs externas
