*** Settings ***
Resource    ../PrestaResource.robot
Library    String


Suite Setup    Open Browser To Home Page
Suite Teardown    Close Browser
Test Template    Create Account With Invalid Data


*** Variables ***
${EMAIL_DOMAIN} =    @expleogroup.com


*** Test Cases ***    first_name    last_name        email                    password        birth_date
No FirstName          ${EMPTY}      Doe              doe@expleogroup.com      Password1       2000-01-01
No LastName           John          ${EMPTY}         john@expleogroup.com     Password1       2000-01-01
No Email              John          Doe              ${EMPTY}                 Password1       2000-01-01
No Password           John          Doe              john@expleogroup.com     ${EMPTY}        2000-01-01
No BirthDate          John          Doe              john@expleogroup.com     Password1       01-01-2000


*** Keywords *** 
Create Account With Invalid Data  
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}    ${birth_date}
    Navigate to Create Account
    Input FirstName    ${first_name}
    Input LastName    ${last_name}
    Input Email    ${email}
    Input User Password    ${password}
    Input Birthdate    ${birth_date}
    Create Account Failed
    
Create Account Failed
    Click Button    xpath://Button[normalize-space()='Save']
    Title Should Be    Login    
      