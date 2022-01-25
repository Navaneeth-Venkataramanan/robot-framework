*** Settings ***
Documentation     Common library across the entire test suite
Library           SeleniumLibrary    timeout=30    run_on_failure=Take Screenshot
Library           String
Library           DateTime
Library           Collections

*** Variables ***
${welcome_page}    //*[@id="page"]//h2[@class="module__title"]/span
${permission_consent_dialog_header}    //div[@class="fc-dialog-content"]//h1
${permission_consent_dialog_consent_button}    //button[@class="fc-button fc-cta-consent fc-primary-button"]//p[text()="Consent"]
${navigation_link}    //div[@id="orb-nav-links"]//ul/li/a[text()="LINK"]
${navigation_link_list}    (//div[@id="orb-nav-links"]//ul/li)[INDEX]
${day_and_date}    //div[@id="orb-modules"]//h2[@class="module__title"]
${search}    //input[@id="orb-search-q"]
${search_results_list}    //ul[@role="list" and @class="ssrcss-v19xcd-Stack e1y4nx260"]//li//div//p


*** Keywords ***
Page Title Is
    [Arguments]    ${expected_page_title}
    ${actual_page_title}    Get Title
    Wait Until Keyword Succeeds    3x    5s    Title Should Be    ${actual_page_title}    ${expected_page_title}

Validate Home Page
    [Arguments]    ${expected_home_page_title}
    Wait Until Page Contains Element    ${welcome_page}
    Wait Until Keyword Succeeds    3x    5s    Element Text Should Be    ${welcome_page}    ${expected_home_page_title}

Cosent To Share Your Personal Data
    Wait Until Element is Visible    ${permission_consent_dialog_header}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${permission_consent_dialog_consent_button}

Main Navigation Link Should Be
    [Arguments]    ${expected_title}    ${link_list_index}
    ${link_list} =    Replace String   ${navigation_link_list}    INDEX   ${link_list_index}
    Wait Until Page Contains Element    ${link_list}
    Wait Until Keyword Succeeds    3x    5s    Element Text Should Be    ${link_list}    ${expected_title}

Click Navigation Link
    [Arguments]    ${link_name}
    ${link} =    Replace String   ${navigation_link}    LINK   ${link_name}
    Wait Until Page Contains Element    ${link}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${link}

Verify the Current Url Is
    [Arguments]    ${expecetd_url}
    ${expecetd_url} =   Get Location
    Should Be Equal As Strings    ${expecetd_url}    ${expecetd_url}

Validate Day and Date
    ${expected_date} =    Get Text    ${day_and_date}
    ${actual_date} =    Get Current Date
    ${converted_actual_date} =    Convert Date      ${actual_date}      result_format=%A, %d %B
    ${converted_expected_date} =    Get Substring    ${expected_date}    19     38
    Should Be Equal As Strings    ${converted_actual_date}    ${converted_expected_date}

Search For
    [Arguments]    ${search_text}
    Wait Until Page Contains Element    ${search}
    Wait Until Keyword Succeeds    3x    5s    Click Element    ${search}
    Input Text    ${search}    ${search_text}
    Press Keys    ${search}    ENTER

Verify the Search Results
    ${count} =    Get Element Count  ${search_results_list}
    ${create_search_results_list} =   Create List
    FOR    ${i}    IN RANGE    1    ${count} + 1
    ${search_results} =    Get Text    xpath=(${search_results_list})[${i}]
    Append To List    ${create_search_results_list}    ${search_results}
    END
    Log List    ${create_search_results_list}    INFO