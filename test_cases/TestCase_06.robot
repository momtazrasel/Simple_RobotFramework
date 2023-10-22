*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}  https://www.jimms.fi/
${login_button}  xpath://a[@alt='Login']
${no_radio_button}  xpath://input[@id='private-tab-input']
${email_text_field}  xpath://input[@id='pf-EmailAddress']
${password_text_field}  xpath://input[@id='pf-Password']
${confirm_password_text_field}  xpath://input[@id='pf-ConfirmPassword']
${first_name_text_field}  xpath://input[@id='pf-FirstName']
${last_name_text_field}  xpath://input[@id='pf-LastName']
${address_text_field}  xpath://input[@id='pf-Address']
${postal_code_text_field}  xpath://input[@id='pf-PostalCode']
${city_text_field}  xpath://input[@id='pf-City']
${phone_text_field}  xpath://input[@id='pf-Phone']
${privacy_checkbox}  xpath://input[@id='pf-GDPR']
${create_account_button}  xpath://input[@value='Luo asiakastili']



*** Test Cases ***
CreateNewAccount
	Open Browser    ${url}   chrome
	Sleep    3
	Click Element    ${login_button}
	Sleep    7
	Click Element    ${no_radio_button}
	Sleep    2
    Input Text    ${email_text_field}   rasel.qups@gmail.com
    Sleep    2
    Input Text    ${password_text_field}   password12345
    Sleep    2
    Input Text    ${confirm_password_text_field}   password12345
    Sleep    2
    Input Text    ${first_name_text_field}   rasel
    Sleep    2
    Input Text    ${last_name_text_field}   uddin
    Sleep    2
    Input Text    ${address_text_field}   finland
    Sleep    2
    Input Text    ${postal_code_text_field}   finland1234
    Sleep    2
    Input Text    ${city_text_field}   finland
    Sleep    2
    Input Text    ${phone_text_field}   +6235276897
    Sleep    2
    Click Element    ${privacy_checkbox}
    Sleep    2
    Click Element    ${create_account_button}
    Sleep    2
    Close Browser

