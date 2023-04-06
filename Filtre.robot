*** Settings ***
Documentation           verify Filtre option
Library    SeleniumLibrary
Library    Collections
Library    BuiltIn
Test Setup       open the browser with the url
Test Teardown    Close Browser

*** Variables ***
@{Filtre1} =      ${Fabricant}    ${Courant sortie (Max)}     ${Fréquence de fonctio. Min}    ${Fréquence de fonctio. Max}    ${Nombre de sortie}     ${Puissance}    ${Taille / Dimension}   ${Température de foncti.}   #${Tension sortie 1}
@{Filtre2} =      ${Fréquence de fonctio. Min2}    ${Fréquence de fonctio. Max2}    ${Nombre de sortie2}    ${Taille / Dimension2}     ${Tension d'entrée (Max)}   ${Tension d'entrée (Min)}   ${Tension sortie 12}
${Fabricant} =                    //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[1]/div[2]/select[1]
${Courant sortie (Max)} =        //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[2]/div[2]/select[1]
${Fréquence de fonctio. Min} =  //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[3]/div[2]/select[1]
${Fréquence de fonctio. Max} =  //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[4]/div[2]/select[1]
${Nombre de sortie} =           //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[5]/div[2]/select[1]
${Puissance } =                 //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[6]/div[2]/select[1]
${Taille / Dimension} =        //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[7]/div[2]/select[1]
${Température de foncti.} =    //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[8]/div[2]/select[1]
${Tension sortie 1} =         //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[9]/div[2]/select[1]

${Courant sortie (Max)2} =        //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[2]/div[2]/select[1]
${Fréquence de fonctio. Min2} =  //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[2]/div[2]/select[1]
${Fréquence de fonctio. Max2} =  //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[3]/div[2]/select[1]
${Nombre de sortie2} =           //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[4]/div[2]/select[1]
${Taille / Dimension2} =        //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[5]/div[2]/select[1]
${Tension d'entrée (Max)} =         //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[6]/div[2]/select[1]
${Tension d'entrée (Min)} =     //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[7]/div[2]/select[1]
${Tension sortie 12} =         //body/div[@id='wrapper']/main[@id='main']/div[1]/div[1]/div[1]/aside[1]/div[2]/div[8]/div[2]/select[1]
${product1} =       link=Transformateur myrra 230V 6V 800mA
${expected_product1} =      Transformateur myrra 230V 6V 800mA
${product2} =       link=Transformateur 220V/9V AC
${expected_product2} =      Transformateur 220V/9V AC
*** Test Cases ***
select the specify product 1
    select the product      ${Filtre1}    1
    check the product       ${product1}         ${expected_product1}
select the specify product 2
    select the first condition
    select the product      ${Filtre2}    1
    check the product       ${product2}         ${expected_product2}
*** Keywords ***
open the browser with the url
    Create Webdriver    Chrome  executable_path=C:\Users\DHR 1\Documents\chromedriver
    Go To               http://192.168.31.31/
    Click Element       //span[contains(text(),'Alimentations')]
    Click Element       link=Transformateurs


select the product
    [Arguments]         ${Filtre}   ${index}
    FOR    ${i}    IN  @{Filtre}
            Select From List By Index   ${i}   ${index}
            Sleep    2
    END
    Click Element       //button[contains(text(),'Filtre')]
    Sleep    5
check the product
    [Arguments]    ${product}           ${expected_product}
    Element Text Should Be       ${product}         ${expected_product}

select the first condition
    Select From List By Index   ${Courant sortie (Max)2}    2
    Sleep    2


