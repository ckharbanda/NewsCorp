*** Settings ***
Library     JSONLibrary
Library     RequestsLibrary
Library     Selenium2Library
Library     Process
Library     Collections
Library     CustomKeywords.py

*** Keywords ***
user reads the JSON file
    ${json_object}=	  Load JSON From File  	      ../../Digital/API/example.json
    set test variable    ${json_object}

Get key based on attribute matching key value
    [Arguments]     ${matched_key}    ${matched_value}
    ${final_list}=        create list
    log to console      The empty list is ${final_list}
    @{keys_list}=             get dictionary keys     ${json_object}
    log to console   The keys list value is ${keys_list}
    :FOR    ${key}    IN    @{keys_list}
    \    ${value}=     get from dictionary    ${json_object}   ${key}
    \    log to console     The value of ${key} is ${value}
    \    ${device_name}=     get from dictionary     ${value}    ${matched_key}
    \    run keyword if    '${device_name}'=='${matched_value}' or '${device_name}'=='all'   append to list      ${final_list}    ${key}
    log to console    The final list is ${final_list}
    set test variable    ${final_list}
    [Return]    ${final_list}

the user should see the device mobile matching list
    list should contain value    ${final_list}    ad
    list should contain value    ${final_list}    news story
    list should contain value    ${final_list}    query
    list should not contain value    ${final_list}    video
    list should not contain value    ${final_list}    image gallery

the user should see the device all matching list
    list should not contain value    ${final_list}    ad
    list should contain value    ${final_list}    news story
    list should contain value    ${final_list}    query
    list should not contain value    ${final_list}    video
    list should not contain value    ${final_list}    image gallery