*** Settings ***
Resource         ../resource/front.resource
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           String

*** Test Cases ***
Abrir Navegador
    Abrir Navegador