*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               PrestCreateValidAccount.robot file.
Resource    ../PrestaResource.robot
Test Setup    Open Browser To Home Page
Test Teardown    Close Browser



*** Test Cases ***
Valid Login
    Given browser is open on login page
    When user ${VALID_EMAIL} logs in with password ${VALID_PASSWORD}
    Then My Account page should be displayed
    
    

*** Keywords ***
Browser is open on login page
    Navigate to Sign In Page
    
User ${email} logs in with password ${password}
    Input Email    ${VALID_EMAIL}
    Input User Password    ${VALID_PASSWORD}
    Sign In
    
My Account page should be displayed
    My Account Page Should Be Open