*** Settings ***
Resource   ../central.robot

*** Variables ***
${URL}                    http://localhost:3000/

*** Keywords ***

Dado que eu acesso o Organo
    Open Browser    url=${URL}   browser=Chrome

Fechar o navegador
    Close Browser