*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           String

*** Variables ***
${BASE_URL}                  https://shogun.qacoders.dev.br/login
${ADMIN_EMAIL}               sysadmin@qacoders.com
${ADMIN_PASSWORD}            1234@Test
${CHARS_COM_ACENTOS}         abcdefghijklmnopqrstuvwxyzáàâãéèêíïóôõöúç

${MSG_ERRO_DUPLICADO}        Não é possível salvar esse registro. Diretoria já cadastrada no sistema.
${MSG_ERRO_OBRIGATORIO}      O campo 'diretoria' é obrigatório.
${MSG_ERRO_MIN_CHARS}        O nome da diretoria deve ter no mínimo 2 caracteres.
${MSG_ERRO_MAX_CHARS}        O campo 'diretoria' deve possuir no máximo 50 caracteres.
${MSG_ERRO_CHARS_INVALIDOS}  O campo 'diretoria' só pode conter letras e o caractere especial '&'.
${MSG_ERRO_VINCULO}          Não é possível inativar a Diretoria. Essa Diretoria faz parte de um cadastro ativo.
${MSG_ERRO_NAO_ENCONTRADO}   Cadastro não encontrado
${MSG_ERRO_JA_INATIVO}       Ao escolher inativar, não será mais possível utilizar essa Diretoria. Deseja realmente inativar?

*** Keywords ***
Abrir Navegador
    Open Browser    
    Maximize Browser Window

    Go To    url=${BASE_URL}
    Input Text    xpath=//*[@id="email"]    text=${ADMIN_EMAIL}
    Input Text    xpath=//*[@id="password"]    text=${ADMIN_PASSWORD}
    Click Button    xpath=//*[@id="login"]
    Wait Until Element Is Visible    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Centro de Custo"]
    #Wait Until Element Is Visible    xpath=/html/body/div/div/div/div[2]/div[2]/div
    #Scroll Element Into View    xpath=/html/body/div/div/div/div[2]/div[2]/div
    Wait Until Element Is Visible    xpath=//p[text()='Supernatural']/following-sibling::div/button[text()='Editar']
    Click Element    xpath=//p[text()='Supernatural']/following-sibling::div/button[text()='Editar']
    Wait Until Element Is Visible    xpath=//*[@id="costCentername"]
    Input Text    xpath=//*[@id="costCentername"]    text=!!!!!!!!!!!!!
    Click Element    xpath=//*[@id="Diretoria"]/option[2]
    Click Element    xpath=//*[@id="save"]
    Wait Until Page Contains Element    xpath=//div[contains(@class,'MuiAlert-message') and contains(text(),"centro de custos' só pode conter")]    15s
    #Wait Until Page Contains Element    xpath=//div[contains(@class,'MuiAlert-message') and text()="O campo 'centro de custos' só pode conter letras e o caractere especial '&'."]
    Close Browser
    #Should Be Equal As Strings    xpath=/html/body/div/div/div[2]/div/form/div[1]/div[2]    O campo 'centro de custos' só pode conter letras e o caractere especial '&'.

    #Click Element    xpath=//*[@id="Diretoria"]