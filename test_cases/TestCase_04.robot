*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}  https://www.jimms.fi/
${input_search}   xpath://input[@id='searchinput']
${lisa_korinn_button}   xpath:(//a[@title='Lisää koriin'])[1]
${lisa_korinn_Icon}   xpath:(//i[@class='material-icon me-1'][normalize-space()='add_shopping_cart'])[1]


*** Test Cases ***
LisääkoriinIcon
	Open Browser    ${url}   chrome
	Sleep    3
    Input Text    ${input_search}  ps5
    Sleep    2
    Press Key    ${input_search}   \\13
    Sleep    2
    ${button_title}=    Get Text    ${lisa_korinn_button}
    Should Contain    ${button_title}    LISÄÄ KORIIN
    Sleep    2
    Element Should Be Visible    ${lisa_korinn_Icon}
    Sleep    2
    Capture Element Screenshot    ${lisa_korinn_Icon}   icon.png
    Close Browser

