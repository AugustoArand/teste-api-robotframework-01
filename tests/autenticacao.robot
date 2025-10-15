*** Settings ***
Documentation    Exemplo simples de teste de login usando elementos do loginScreen.yaml
...              
...              Este teste demonstra como utilizar as keywords individuais para:
...              1. Preencher campo de usuário
...              2. Preencher campo de senha  
...              3. Clicar no botão de login
...              4. Validar o resultado
...              
...              Todos os elementos são baseados no arquivo config/loginScreen.yaml

Library          SeleniumLibrary
Library          Collections
Library          OperatingSystem
Library          yaml    # Para carregar arquivos YAML
Resource         ../resources/keywords/auth_keywords.robot

Variables        ../config/auth.yaml

Test Setup       Abrir Navegador Para Login    chrome    False
Test Teardown    Fechar Navegador

*** Test Cases ***
Cenário 01 - Preenchimento Manual dos Campos
    [Documentation]    Demonstra o uso individual de cada keyword de preenchimento
    [Tags]    exemplo    manual    demo
    
    # Passo 1: Preencher campo usuário
    Log    🔤 Preenchendo campo usuário...
    Preencher Campo Usuario    ${valid_login.username}
    
    # Pausa para visualização (opcional)
    Sleep    1s
    
    # Passo 2: Preencher campo senha
    Log    🔒 Preenchendo campo senha...
    Preencher Campo Senha    ${valid_login.password}
    
    # Pausa para visualização (opcional) 
    Sleep    1s
    
    # Passo 3: Clicar no botão de login
    Log    🖱️ Clicando no botão de login...
    Clicar Botao Login
    
    # Passo 4: Validar sucesso
    Log    ✅ Validando login...
    Validar Login Sucesso Web
    
    Log    🎉 Teste concluído com sucesso!


Cenário 02 - Teste de Validação de Erro
    [Documentation]    Demonstra como testar cenários de erro
    [Tags]    exemplo    erro    demo
    
    Log    ❌ Testando credenciais inválidas...
    Realizar Login Completo Web    ${invalid_login.username}    ${invalid_login.password}
    
    Log    🔍 Validando mensagem de erro...
    Validar Login Falha Web    Username and password do not match
    
    Log    ✅ Validação de erro funcionou corretamente!