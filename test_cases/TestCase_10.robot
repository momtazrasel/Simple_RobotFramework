*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}  https://www.jimms.fi/
${input_search}   xpath://input[@id='searchinput']
${lisa_korinn_button}   xpath:(//a[@title='Lisää koriin'])[1]
${cart_button}   xpath:(//a[@class='btn btn-cart'])[1]
${cross_icon}   xpath:(//div[@class='dy-full-width-notifications-close'])[1]
${initial_price}   xpath://span[@class='price price--sale-colored text-end']
${updated_price}   xpath://span[@class='price__amount fw-bold text-nowrap']
${plus_icon}   xpath://i[normalize-space()='add_circle']

*** Test Cases ***
VerifyPriceIncreaseAfterPlusIconClick
	Open Browser    ${url}   chrome
	Sleep    3
    Input Text    ${input_search}  ps5
    Sleep    2
    Press Key    ${input_search}   \\13
    Sleep    2
    ${button_title}=    Get Text    ${lisa_korinn_button}
    Should Contain    ${button_title}    LISÄÄ KORIIN
    Sleep    2
    Click Element    ${lisa_korinn_button}
    Sleep    5
    Click Element    ${cart_button}
    Sleep    5
    ${initial_price_value}=     Get Text    ${initial_price}
    Sleep    5
    Click Element  ${plus_icon}
    Sleep    5
    ${updated_price_value}=     Get Text    ${updated_price}
    Sleep    5
    Should Be True  ${updated_price_value} > ${initial_price_value}
    Close Browser

