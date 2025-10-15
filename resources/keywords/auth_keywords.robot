*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    yaml
Variables  ../../config/auth.yaml
Variables  ../../config/loginScreen.yaml

*** Keywords ***
# =============================================================================
# KEYWORDS DE TESTE WEB - INTERFACE DE LOGIN
# =============================================================================

Abrir Navegador Para Login
    [Documentation]    Abre o navegador e navega para a página de login
    [Arguments]    ${browser}=chrome    ${headless}=False
    
    ${chrome_options}=    Create List
    IF    ${headless}
        Append To List    ${chrome_options}    --headless
    END
    Append To List    ${chrome_options}    --no-sandbox
    Append To List    ${chrome_options}    --disable-dev-shm-usage
    
    # Usa a URL do SauceDemo
    ${base_url}=    Set Variable    https://www.saucedemo.com
    Open Browser    ${base_url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    id=user-name    timeout=10s

Preencher Campo Usuario
    [Documentation]    Preenche o campo de usuário na tela de login usando ID do loginScreen.yaml
    [Arguments]    ${username}
    
    Wait Until Element Is Visible    id=user-name    timeout=10s
    Clear Element Text    id=user-name
    Input Text    id=user-name    ${username}
    Log    Campo usuário preenchido com: ${username}

Preencher Campo Senha
    [Documentation]    Preenche o campo de senha na tela de login usando ID do loginScreen.yaml
    [Arguments]    ${password}
    
    Wait Until Element Is Visible    id=password    timeout=10s
    Clear Element Text    id=password
    Input Password    id=password    ${password}
    Log    Campo senha preenchido

Clicar Botao Login
    [Documentation]    Clica no botão de login usando ID do loginScreen.yaml
    
    Wait Until Element Is Visible    id=login-button    timeout=10s
    Click Element    id=login-button
    Log    Botão de login clicado

Realizar Login Completo Web
    [Documentation]    Realiza o processo completo de login na interface web
    [Arguments]    ${username}    ${password}
    
    Preencher Campo Usuario    ${username}
    Preencher Campo Senha      ${password}
    Clicar Botao Login
    
    # Aguarda redirecionamento ou resposta
    Sleep    2s

Validar Login Sucesso Web
    [Documentation]    Valida se o login web foi realizado com sucesso
    
    # Aguarda carregamento da página pós-login
    Wait Until Page Does Not Contain Element    id=login-button    timeout=10s
    
    # Verifica se não está mais na página de login
    ${current_url}=    Get Location
    Should Not Contain    ${current_url}    saucedemo.com/v    # Não deve estar na página inicial
    Should Contain       ${current_url}    inventory.html      # Deve estar na página de inventário
    Log    Login web realizado com sucesso! URL atual: ${current_url}

Validar Login Falha Web
    [Documentation]    Valida se o login web falhou conforme esperado
    [Arguments]    ${expected_error_message}=Invalid credentials
    
    # Verifica se ainda está na página de login
    Wait Until Element Is Visible    id=login-button    timeout=5s
    
    # Verifica se há mensagem de erro no container de erro do SauceDemo
    Wait Until Element Is Visible    css=[data-test="error"]    timeout=5s
    ${error_message}=    Get Text    css=[data-test="error"]
    Should Contain    ${error_message}    ${expected_error_message}    ignore_case=True
    Log    Login web falhou conforme esperado: ${error_message}

Fechar Navegador
    [Documentation]    Fecha o navegador
    
    Close All Browsers