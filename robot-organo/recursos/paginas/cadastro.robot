*** Settings ***
Resource    ../central.robot

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{SELECIONAR_TIME}
...            //option[contains(.,'Programação')]
...            //option[contains(.,'Front-End')]
...            //option[contains(.,'Data Science')]
...            //option[contains(.,'Devops')] 
...            //option[contains(.,'UX e Design')]
...            //option[contains(.,'Mobile')]
...            //option[contains(.,'Inovação e Gestão')]
${COLABORADOR}            class:colaborador

*** Keywords ***

Dado que preencha os campos do formulario
    ${NOME}              FakerLibrary.First Name
    Input Text           ${CAMPO_NOME}      ${NOME}
    ${CARGO}             FakerLibrary.Job
    Input Text           ${CAMPO_CARGO}     ${CARGO}
    ${IMAGEM}             FakerLibrary.Image Url    width=100    height=100
    Input Text           ${CAMPO_IMAGEM}    ${IMAGEM}
    Click Element        ${CAMPO_TIME}
    Click Element        ${SELECIONAR_TIME}[0]

E clique no botao criar card
    Click Element        ${BOTAO_CARD}

Entao identificar o card no time esperado
    Element Should Be Visible    ${COLABORADOR}

Entao identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do formulario
        E clique no botao criar card
    END

Entao criar e identificar 1 card em cada time disponivel
    FOR    ${indice}    ${time}    IN ENUMERATE    @{SELECIONAR_TIME}
        Dado que preencha os campos do formulario
        Click Element    ${time}
        E clique no botao criar card
    END

Dado que eu clique no botao criar card
    Click Element    ${BOTAO_CARD}

Entao sistema deve apresentar mensagem de campo obrigatorio
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro