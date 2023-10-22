*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}  https://www.jimms.fi/
${login_button}  xpath://a[@alt='Login']
${user_name_text_field}  xpath://input[@id='l-UserName']
${password_text_field}  xpath://input[@id='l-Password']
${login_button}  xpath://input[@id='loginbtn']




*** Test Cases ***
LoginWithValidCredentials
	Open Browser    ${url}   chrome
	Sleep    3
	Click Element    ${login_button}
	Sleep    2
	Input Text    ${user_name_text_field}   rasel.qups@gmail.com
    Sleep    2
    Input Text    ${password_text_field}   password12345
    Sleep    2
    Click Element    ${login_button}
    Sleep    2
    Close Browser

