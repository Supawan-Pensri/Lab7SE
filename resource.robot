*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
# ${BROWSER}        Chrome
${DELAY}          0.1
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${FORM URL}       http://${SERVER}/Form.html
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Set Variable    ${chrome_options.binary_location}    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${LOGIN URL}
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
    

Open Browser To Form Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Set Variable    ${chrome_options.binary_location}    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${FORM URL}
    Set Selenium Speed    ${DELAY}

Open To Form Page
    Go To    ${FORM URL}
Input Firstname
    [Arguments]    ${Firstname}
    Input Text    id:firstname    ${Firstname}

Input Lastname
    [Arguments]    ${Lastname}
    Input Text    id:lastname    ${Lastname}

Input Destination
    [Arguments]    ${Destination}
    Input Text    id:destination    ${Destination}

Input Contactperson
    [Arguments]    ${Contactperson}
    Input Text    id:contactperson    ${Contactperson}

Input Relationship
    [Arguments]    ${Relationship}
    Input Text    id:relationship    ${Relationship}

Input Email
    [Arguments]    ${Email}
    Input Text    id:email    ${Email}

Input Phone
    [Arguments]    ${Phone}
    Input Text    id:phone    ${Phone}

Click SubmitButton
    Click Element    xpath=//input[@type='submit' and @id='submitButton']

Complete Page Should Be Open
    Title Should Be    Completed