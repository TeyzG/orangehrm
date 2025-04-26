*** Settings ***
Documentation    Test dang nhap OrangeHRM
Library    SeleniumLibrary
Suite Setup    Mo Trang
Suite Teardown    Dong Trang

*** Variables ***
${LINK}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${TRINH_DUYET}    Chrome

*** Test Cases ***
Dang Nhap Dung
    [Documentation]    Kiem tra dang nhap dung
    Nhap Ten    Admin
    Nhap Pass    admin123
    Click Nut Login
    Kiem Tra Dashboard
    Dang Xuat Ra
    Kiem Tra Trang Login

Dang Nhap Sai
    [Documentation]    Kiem tra dang nhap sai
    Nhap Ten    user123
    Nhap Pass    pass123
    Click Nut Login
    Kiem Tra Loi

*** Keywords ***
Mo Trang
    Open Browser    ${LINK}    ${TRINH_DUYET}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath://input[@name='username']    15s
    # mo trang web

Nhap Ten
    [Arguments]    ${ten}
    Input Text    xpath://input[@name='username']    ${ten}
    # nhap ten dang nhap

Nhap Pass
    [Arguments]    ${pass}
    Input Text    xpath://input[@name='password']    ${pass}
    # nhap pass vao o mat khau

Click Nut Login
    Click Element    xpath://button[contains(@class, 'oxd-button')]
    # click nut dang nhap

Kiem Tra Dashboard
    Wait Until Element Is Visible    xpath://header[contains(@class, 'oxd-topbar')]    10s
    Element Should Be Visible    xpath://header[contains(@class, 'oxd-topbar')]
    # check vao dashboard

Kiem Tra Loi
    Wait Until Element Is Visible    xpath://p[contains(@class, 'oxd-alert-content-text')]    10s
    Element Text Should Be    xpath://p[contains(@class, 'oxd-alert-content-text')]    Invalid credentials
    # check loi sai

Dang Xuat Ra
    Click Element    xpath://span[contains(@class, 'oxd-userdropdown-tab')]
    Wait Until Element Is Visible    xpath://a[@href='/web/index.php/auth/logout']    10s
    Click Element    xpath://a[@href='/web/index.php/auth/logout']
    # an nut dang xuat

Kiem Tra Trang Login
    Wait Until Element Is Visible    xpath://div[contains(@class, 'orangehrm-login-branding')]    10s
    Element Should Be Visible    xpath://div[contains(@class, 'orangehrm-login-branding')]
    # check ve trang login

Dong Trang
    Close Browser
    # dong trinh duyet lai