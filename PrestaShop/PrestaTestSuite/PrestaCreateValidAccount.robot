*** Settings ***

Resource    ../PrestaResource.robot
Library    String


Suite Setup    Open Browser To Home Page
Suite Teardown    Close Browser


*** Variables ***
${PASSWORD} =    Password1
${EMAIL_DOMAIN} =    @expleogroup.com


*** Test Cases ***
Create Valid Account
    ${first_name} =     Generate Random String    8    [LETTERS]
    ${last_name} =     Generate Random String    8    [LETTERS]
    ${email} =    Catenate    SEPARATOR=    ${first_name}    ${EMAIL_DOMAIN}
    Navigate to Create Account 
    Input FirstName    ${first_name}
    Input LastName    ${last_name}
    Input Email    ${email}
    Input User Password    ${PASSWORD}
    Input Birthdate    ${VALID_DOB}
    Save Details
    
Valid Login
    Navigate to Sign In Page
    Input Email    ${VALID_EMAIL}    
    Input User Password    ${VALID_PASSWORD} 
    Sign In 
    My Account Page Should Be Open 