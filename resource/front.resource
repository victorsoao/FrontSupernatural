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
01 - Cadastrar diretoria com sucesso
    Open Browser    
    Maximize Browser Window

    Go To    url=${BASE_URL}
    Input Text    xpath=//*[@id="email"]    text=${ADMIN_EMAIL}
    Input Text    xpath=//*[@id="password"]    text=${ADMIN_PASSWORD}
    Click Button    xpath=//*[@id="login"]
    Wait Until Element Is Visible    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Centro de Custo"]
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div
    Scroll Element Into View    xpath=/html/body/div/div/div[2]/div[2]/div
    Wait Until Element Is Visible    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Click Element    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Wait Until Element Is Visible    xpath=//*[@id="costCentername"]
    Input Text    xpath=//*[@id="costCentername"]    text=Diretorianova
    Click Element    xpath=//*[@id="Diretoria"]
    Click Element    xpath=//*[@id="Diretoria"]/option[2]
    Click Element    xpath=//*[@id="save"]
    Close Browser

02 - Diretoria em branco 
    Open Browser    
    Maximize Browser Window

    Go To    url=${BASE_URL}
    Input Text    xpath=//*[@id="email"]    text=${ADMIN_EMAIL}
    Input Text    xpath=//*[@id="password"]    text=${ADMIN_PASSWORD}
    Click Button    xpath=//*[@id="login"]
    Wait Until Element Is Visible    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Centro de Custo"]
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div
    Scroll Element Into View    xpath=/html/body/div/div/div[2]/div[2]/div
    Wait Until Element Is Visible    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Click Element    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Wait Until Element Is Visible    xpath=//*[@id="costCentername"]
    Input Text    xpath=//*[@id="costCentername"]    text=Diretoria de Teste123
    Click Element    xpath=//*[@id="Diretoria"]
    Click Element    xpath=//*[@id="Diretoria"]/option[2]
    Click Element    xpath=//*[@id="save"]
    Close Browser

03 - Diretoria com 01 caractere
    Open Browser    
    Maximize Browser Window

    Go To    url=${BASE_URL}
    Input Text    xpath=//*[@id="email"]    text=${ADMIN_EMAIL}
    Input Text    xpath=//*[@id="password"]    text=${ADMIN_PASSWORD}
    Click Button    xpath=//*[@id="login"]
    Wait Until Element Is Visible    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Centro de Custo"]
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div
    Scroll Element Into View    xpath=/html/body/div/div/div[2]/div[2]/div
    Wait Until Element Is Visible    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Click Element    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Wait Until Element Is Visible    xpath=//*[@id="costCentername"]
    Input Text    xpath=//*[@id="costCentername"]    text=a
    Click Element    xpath=//*[@id="Diretoria"]
    Click Element    xpath=//*[@id="Diretoria"]/option[2]
    Click Element    xpath=//*[@id="save"]
    Wait Until Element Is Visible    xpath=//p[text()='O campo diretoria é obrigatório']
    Close Browser

04 - Diretoria com 51 caractere
    Open Browser    
    Maximize Browser Window

    Go To    url=${BASE_URL}
    Input Text    xpath=//*[@id="email"]    text=${ADMIN_EMAIL}
    Input Text    xpath=//*[@id="password"]    text=${ADMIN_PASSWORD}
    Click Button    xpath=//*[@id="login"]
    Wait Until Element Is Visible    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Centro de Custo"]
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div
    Scroll Element Into View    xpath=/html/body/div/div/div[2]/div[2]/div
    Wait Until Element Is Visible    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Click Element    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Wait Until Element Is Visible    xpath=//*[@id="costCentername"]
    Input Text    xpath=//*[@id="costCentername"]    text=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    Click Element    xpath=//*[@id="Diretoria"]
    Click Element    xpath=//*[@id="Diretoria"]/option[2]
    Click Element    xpath=//*[@id="save"]
    Wait Until Element Is Visible    xpath=//p[text()='O campo diretoria pode ter no máximo 50 caracteres']
    Close Browser

05 - Diretoria com números e caractere especial
    Open Browser
    Maximize Browser Window

    Go To    url=${BASE_URL}
    Input Text    xpath=//*[@id="email"]    text=${ADMIN_EMAIL}
    Input Text    xpath=//*[@id="password"]    text=${ADMIN_PASSWORD}
    Click Button    xpath=//*[@id="login"]
    Wait Until Element Is Visible    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Cadastros"]
    Click Element    xpath=//*[@id="Centro de Custo"]
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div
    Scroll Element Into View    xpath=/html/body/div/div/div[2]/div[2]/div
    Wait Until Element Is Visible    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Click Element    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']
    Wait Until Element Is Visible    xpath=//*[@id="costCentername"]
    Input Text    xpath=//*[@id="costCentername"]    text=123123123!!
    Click Element    xpath=//*[@id="Diretoria"]
    Click Element    xpath=//*[@id="Diretoria"]/option[3]
    Click Element    xpath=//*[@id="save"]
    Wait Until Page Contains Element        xpath=//div[contains(@class,'MuiAlert-message') and contains(text(),"centro de custos' só pode conter")]    15s
    #Wait Until Page Contains Element        xpath=//div[contains(@class,'MuiAlert-message') and contains(text(),"O campo 'centro de custos' só pode conter letras e o caractere especial '&'.")]    15s
    Close Browser
    
