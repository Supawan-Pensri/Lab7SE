*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Open Form
    Open Browser To Form Page

Record Success
    Open To Form Page
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Click SubmitButton
    Complete Page Should Be Open
    [Teardown]    Close Browser

Open Form
    Open Browser To Form Page
Empty Destination
    Open To Form Page
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    ${EMPTY}
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Click SubmitButton
    Complete Page Should Be Open
    [Teardown]    Close Browser

Open Form
    Open Browser To Form Page
Empty Email
    Open To Form Page
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    ${EMPTY}
    Input Phone    081-111-1234
    Click SubmitButton
    Complete Page Should Be Open
    [Teardown]    Close Browser
Open Form
    Open Browser To Form Page
Invalid Email
    Open To Form Page
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@
    Input Phone    081-111-1234
    Click SubmitButton
    Complete Page Should Be Open
    [Teardown]    Close Browser
Open Form
    Open Browser To Form Page
Empty Phone Number
    Open To Form Page
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    ${EMPTY}
    Click SubmitButton
    Complete Page Should Be Open
    [Teardown]    Close Browser
Open Form
    Open Browser To Form Page
Invalid Phone Number
    Open To Form Page
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    191
    Click SubmitButton
    Complete Page Should Be Open
    [Teardown]    Close Browser