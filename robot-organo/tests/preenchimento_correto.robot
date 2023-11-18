*** Settings ***
Resource     ../recursos/central.robot

Test Setup         Dado que eu acesso o Organo
Test Teardown      Fechar o navegador

*** Test Cases ***

TC01: Verificar se ao preencher os campos do formulario corretamente os dados são inseridos na lista e se um novo card é criado no time esperado
    
    Dado que preencha os campos do formulario
    E clique no botao criar card
    Entao identificar o card no time esperado

TC02: Verificar se é possivel criar mais de um card se preenchermos os campos corretamentes

    Dado que preencha os campos do formulario
    E clique no botao criar card
    Entao identificar 3 cards no time esperado

TC03: Verificar se é possivel criar um card para cada time disponivel se preenchermos os campos corretamente
    
    Dado que preencha os campos do formulario
    Entao criar e identificar 1 card em cada time disponivel