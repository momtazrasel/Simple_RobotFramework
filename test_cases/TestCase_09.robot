*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}  https://www.jimms.fi/
${login_button}  xpath://a[@alt='Login']
${compaigns_tab}  xpath://a[normalize-space()='Kampanjat']
${outlet_option}  xpath://a[normalize-space()='Outlet']


*** Test Cases ***
CompaignsOutlet
	Open Browser    ${url}   chrome
	Sleep    3
	Maximize Browser Window
	Mouse Over    ${compaigns_tab}
	Sleep    2
	${outlet_title}=    Get Text    ${outlet_option}
	Should Contain    ${outlet_title}  Outlet
	Sleep    2
	Click Element    ${outlet_option}
	Sleep    2
    Close Browser

