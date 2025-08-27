*** Settings ***
Resource         ../resource/front.resource
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           String

*** Test Cases ***
01 - Cadastrar diretoria com sucesso 
    01 - Cadastrar diretoria com sucesso

02 - Diretoria em branco
    02 - Diretoria em branco

03 - Diretoria com 01 caractere
    03 - Diretoria com 01 caractere

04 - Diretoria com 51 caractere
    04 - Diretoria com 51 caractere

05 - Diretoria com números e caractere especial 
    05 - Diretoria com números e caractere especial 

