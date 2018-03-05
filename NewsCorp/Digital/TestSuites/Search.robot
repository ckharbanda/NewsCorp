*** Settings ***
Resource    ../../Digital/StepDefinitions/BddKeywords.robot

*** Test Cases ***
Test Filter widgets by device which have the value mobile
    Given the user has an API to find the widgets
    When the user filter widgets by device which have the value mobile
    Then the user should see the device mobile matching list

Test Filter widgets by device which have the value all
    Given the user has an API to find the widgets
    When the user filter widgets by device which have the value all
    Then the user should see the device all matching list

