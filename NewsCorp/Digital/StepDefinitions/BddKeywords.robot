*** Settings ***
Resource      ../../Digital/PageObjects/Common/widget.robot


*** Keywords ***
the user has an API to find the widgets
    user reads the JSON file

the user filter widgets by device which have the value mobile
    Get key based on attribute matching key value     device   mobile

the user filter widgets by device which have the value all
    Get key based on attribute matching key value     device   all

