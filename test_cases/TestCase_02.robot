*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}  https://www.jimms.fi/
${input_search}   xpath://input[@id='searchinput']
${first_product}  xpath:(//div[@class='row'])[3]
${product_description}  xpath:(//h5[@class='product-box-name'])[1]
${element_text} =  Get Text  ${product_description}

*** Test Cases ***

ProductSearch
	Open Browser    ${url}   chrome
	Sleep    5
    Input Text    ${input_search}  ps5
    Sleep    2
    Press Key    ${input_search}   \\13
    Sleep    2
    Capture Element Screenshot  ${first_product}    screenshot.png
    Sleep    2
    Execute JavaScript  window.scrollBy(0, 500)
    Sleep    2
    ${product_title}=   Get Text    ${product_description}
    Should Contain    ${product_title}   ps5
    Sleep    2
    Close Browser

