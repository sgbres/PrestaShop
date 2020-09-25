*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${PRESTA_URL}                 http://ec2-18-203-109-135.eu-west-1.compute.amazonaws.com/prestashop/
${BROWSER}                    Firefox
${PRESTA_NO_ACCOUNT_URL}      http://ec2-18-203-109-135.eu-west-1.compute.amazonaws.com/prestashop/login?create_account=1
${VALID_FIRST_NAME}           John
${VALID_LAST_NAME}            Doe
${VALID_EMAIL}                johndoe@expleogroup.com
${VALID_PASSWORD}             JohnDoe1
${VALID_DOB}                  2000-01-01
${PRESTA_TEST_DATA}           C:\Users\BreslinS\Documents\PrestaTestData\PrestaTestData.xlsx



*** Keywords ***
Open Browser To Home Page
    Open Browser    ${PRESTA_URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Q-Catalogue
    
Navigate to Create Account
    Click Element    id=_desktop_user_info 
    Click Element    xpath://a[normalize-space()='No account? Create one here']         
    Title Should Be    Login
    
Input FirstName
    [Arguments]    ${first_name}
    Input Text    name:firstname    ${first_name}  

Input LastName
    [Arguments]    ${last_name}
    Input Text    name:lastname    ${last_name} 
    
Input Email
    [Arguments]    ${email}
    Input Text    name:email    ${email} 
    
Input User Password
    [Arguments]    ${password}
    Input Password    name:password    ${password} 
    
Input Birthdate
    [Arguments]    ${birthdate}
    Input Text   name:birthday    ${birthdate} 
    
Sign In
    Click Button    id:submit-login
    
My Account Page Should Be Open
    Title Should Be    My account  
    
Save Details
    Click Button    xpath://Button[normalize-space()='Save']
    Title Should Be    Q-Catalogue  
    
Navigate to Sign In Page
    Click Element    id=_desktop_user_info   
    Title Should Be    Login  