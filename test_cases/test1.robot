*** Settings ***
Documentation     Verify that a website has a landing page in each category
Library           SeleniumLibrary
Library    XML
Suite Setup       Open Browser  ${URL}  Chrome


*** Variables ***
${URL}            https://www.jimms.fi/
${Search Keyword}    ps5
${username}    sujantiwari1024@gmail.com
${password}    Kathmandu1024

*** Test Cases ***
TC_UI_1: Verify Landing Pages in Categories
    Maximize Browser Window
    [Documentation]  Verify that each category has a landing page
    @{categories} =  Get WebElements    //*[@id="sitemegamenu"]/nav/ul[1]/li/a
    FOR  ${category}  IN  @{categories}
        ${category_text} =  Get Text  ${category}
        Log    ${category_text}
        Go To    https://www.jimms.fi/fi/Product/${category_text}
        Wait Until Page Contains    ${category_text}
        Sleep    1s
        Go Back
    END

TC_UI_2: Search for Product
    [Documentation]  Search for a keyword in the search bar
    Input Text    //*[@id="searchinput"]    ${Search Keyword}    # Locate searchbar and search Ps5    
    Press Key    name=q    \\13    # Press the Enter key to submit the search
    #Confirm searchkey is in the search-page
    Page Should Contain    ${Search Keyword}
    Sleep    2s

    #Capture a Screenshot
    Capture Page Screenshot    #Screenshot of the search result page

    #Scrolldown to Bottom
    Scroll Page Down    8000
    Sleep    2s
    Scroll Page Up    8000
    Sleep    2s


TC_UI_3: Check if product has add to cart option inside
    Page Should Contain    Lisää koriin
    Sleep    2s

TC_UI_4: Check if icon is present in Lisää koriin botton
    
    Page Should Contain Element    //*[@id="productsearchpage"]/div[2]/div[5]/div/div[1]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a/i
    Capture Element Screenshot    //*[@id="productsearchpage"]/div[2]/div[5]/div/div[1]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a/i
    Sleep    2s

TC_UC_5: AddtoCart Funtionality   
    Go To    https://www.jimms.fi/fi/Product/Show/195871/jimms-a-gtg-esports-v8-1/jimm-s-gtg-esports-3070-pelitietokone-demo-norm-2099
    Click Element    //*[@id="product-cta-box"]/div/div[3]/div[2]/addto-cart-wrapper/div/a
    Sleep    3s
    Go To    https://www.jimms.fi/fi/ShoppingCart 


TC_UI_6: LogintoWebsite
    Go To    https://www.jimms.fi/fi/Account/Login
    Click Element    //*[@id="accordionItemLogin"]/div/div/div/form/div[1]
    Press Keys    //*[@id="accordionItemLogin"]/div/div/div/form/div[1]    ${username}  
    Click Element    //*[@id="accordionItemLogin"]/div/div/div/form/div[2]
    Press Keys    //*[@id="accordionItemLogin"]/div/div/div/form/div[2]    ${password}
    Click Button    //*[@id="loginbtn"]

TC_UI_7: Subcribr to Newsletter
    Scroll Page Down    5000
    Go To    https://www.jimms.fi/fi/EmailList    #I couldnot click the Newsletter botton so just went to this page instead
    Click Element    //*[@id="email"]
    Press Keys    //*[@id="email"]    ${username}
    Click Button    //*[@id="jim-main"]/div/div/form/div[3]/input
    Sleep    3s


# Sort NewArrivalProduct High to Low Price
#      @{NewArrivalProducts} = Get WebElements    //*[@id="jim-main"]/div[2]/div/div[2]/div[5]/div/div/div[1]/div/ul
#      FOR    ${product}    IN    @{NewArrivalProduct}
#          ${productprice} =    Get Count    ${product}    item
#          Log    ${product}
#      END


*** Keywords ***
Scroll Page Down
    [Arguments]    ${pixels}
    Execute JavaScript    window.scrollBy(10, ${pixels});
    Sleep    2s

Scroll Page Up
    [Arguments]    ${pixels}
    Execute JavaScript    window.scrollBy(-5, ${pixels});
    Sleep    2s
    Execute JavaScript    window.scrollBy(-10, ${pixels});
    Sleep    2s
