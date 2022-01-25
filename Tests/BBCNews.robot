*** Settings ***
Documentation  BBC Test Cases
Library    SeleniumLibrary

Resource  ../Resources/Common.robot
Resource  ../Resources/BBCNewsActionsMenu.robot

Test Setup       Common.Begin Chrome Web Test
Test Teardown    Common.End Web Test

*** Test Cases ***

Verify the Top Navigation Links
    [Documentation]  This test is to verify the top navigation links of bbc website
    [Tags]    UI Functional Test
    Given Common.Go To BBC News Page
    When BBCNewsActionsMenu.Page Title Is    Home - BBC News
    Then BBCNewsActionsMenu.Cosent To Share Your Personal Data
    And BBCNewsActionsMenu.Validate Home Page    Welcome to BBC.com
    And BBCNewsActionsMenu.Main Navigation Link Should Be    Home    1
    And BBCNewsActionsMenu.Main Navigation Link Should Be    News    2
    And BBCNewsActionsMenu.Main Navigation Link Should Be    Sport    3
    And BBCNewsActionsMenu.Main Navigation Link Should Be    Reel    4
    And BBCNewsActionsMenu.Main Navigation Link Should Be    Worklife    5
    And BBCNewsActionsMenu.Main Navigation Link Should Be    Travel    6
    And BBCNewsActionsMenu.Main Navigation Link Should Be    Future    7
    And BBCNewsActionsMenu.Main Navigation Link Should Be    Culture    8

Verify the day and date displayed on the page is correct
    [Documentation]  This test is to verify the day and date displayed on the page is correct
    [Tags]    UI Functional Test
    Given Common.Go To BBC News Page
    When BBCNewsActionsMenu.Page Title Is    Home - BBC News
    Then BBCNewsActionsMenu.Cosent To Share Your Personal Data
    And BBCNewsActionsMenu.Validate Home Page    Welcome to BBC.com
    And BBCNewsActionsMenu.Validate Day and Date

Navigate to the News section and verify url is correct
    [Documentation]  This test is to verify News section is URL is correct
    [Tags]    UI Functional Test
    Given Common.Go To BBC News Page
    When BBCNewsActionsMenu.Page Title Is    Home - BBC News
    Then BBCNewsActionsMenu.Cosent To Share Your Personal Data
    And BBCNewsActionsMenu.Validate Home Page    Welcome to BBC.com
    When BBCNewsActionsMenu.Click Navigation Link    News
    Then Verify the Current Url Is    https://www.bbc.com/news

Verify the search results
    [Documentation]  This test is to verify the search reuslts
    [Tags]    UI Functional Test
    Given Common.Go To BBC News Page
    When BBCNewsActionsMenu.Page Title Is    Home - BBC News
    Then BBCNewsActionsMenu.Cosent To Share Your Personal Data
    And BBCNewsActionsMenu.Validate Home Page    Welcome to BBC.com
    When BBCNewsActionsMenu.Search For    Houghton Mifflin Harcourt
    Then BBCNewsActionsMenu.Verify the Search Results