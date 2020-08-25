*** Settings ***
Library    SeleniumLibrary    

Suite Setup       Log    This block executes before all tests in a suite
Suite Teardown    Log    This block executes after all tests in a suite
Test Setup        Log    This block executes before each test in a suite         
Test Teardown     Log    This block executes after each test in a suite
Default Tags      Sanity         

*** Test Cases ***
MyFirstTest
    Log    This is my first test..
    [Tags]    Smoke
    
MySecondTest
    Log    This is my second test..
    [Tags]    Regression
    
MyThirdTest
    Log    This is my third test..
    [Tags]    Regression
    
MyFourthTest
    Log    This is my fourth test..
    Set Tags    Functional
    
# SeleniumSampleTest
    # [Documentation]                    This is a sample selenium test
    # Open Browser                       @{Credentials}[0]                @{Credentials}[1]
    # BrowserSettings
    # Input Text                         name=q                            Automation step by step
    # Sleep                              2
    # Click Button                       name=btnK
    # Log                                This test is executed by %{username} on %{os}    
    

# SampleLoginTest
    # [Documentation]                    This is a sample login test
    # Open Browser                      ${URL}        chrome
    # BrowserSettings
    # LoginKW
    # Click Element                     link=Timesheets
    # Input Text                        id=employee          &{dictionary}[patient]
    # Press Keys                        id=employee          ENTER
    # Click Button                      xpath=//input[@value='View']
    # Click Element                     id=welcome
    # Sleep                             3
    # Click Element                     link=Logout
    # Sleep                             3
    # Close Browser
    # Log                               Test Completed            
    
                     
*** Variables ***
# Scalar
${URL}                https://opensource-demo.orangehrmlive.com
${username}           Admin
${password}           admin123

# List
@{Credentials}         https://google.com        chrome


# Dictionary
&{dictionary}        patient=John


*** Keywords ***
LoginKW
    Input Text                        id=txtUsername       ${username}
    Input Text                        id=txtPassword       ${password}
    Click Button                      id=btnLogin
    
BrowserSettings
    Sleep                             2
    Set Browser Implicit Wait         5
    Maximize Browser Window
    
Logout
    Close Browser
    Log                                Test Completed
               
