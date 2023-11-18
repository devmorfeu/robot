*** Settings ***
Resource     ../recursos/central.robot

Test Setup         Dado que eu acesso o Organo
Test Teardown      Fechar o navegador

*** Variables ***
${BOTAO_CARD}             id:form-botao

*** Test Cases ***
TC01: Verificar se quando um campo obrigatorio nao for preenchido o sistema exibe uma mensagem de campo obrigatorio
    Dado que eu clique no botao criar card
    Entao sistema deve apresentar mensagem de campo obrigatorio