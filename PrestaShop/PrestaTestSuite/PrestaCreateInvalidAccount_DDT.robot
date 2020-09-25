*** Settings ***
Resource    ../PrestaResource.robot
Library    SeleniumLibrary    
Library    DataDriver     ../TestData/PrestaTestData.xlsx    sheet_name=Sheet1       

Suite Setup    Open Browser To Home Page
Suite Teardown    Close Browser
Test Template    Create Account With Invalid Data


*** Test Cases ***
CreateInvalidAccountWithExcel using   first_name   last_name    email   password   birth_date     


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
      