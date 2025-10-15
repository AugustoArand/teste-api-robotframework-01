#!/usr/bin/env python3
"""
Script para verificar se o Selenium e ChromeDriver estão funcionando corretamente.
Execute este script antes de rodar os testes web do Robot Framework.
"""

import sys
import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def test_selenium_setup():
    """Testa se o Selenium está configurado corretamente"""
    print("🔍 Verificando configuração do Selenium...")
    
    try:
        # Configuração do Chrome
        chrome_options = Options()
        chrome_options.add_argument('--headless')  # Executa sem abrir janela
        chrome_options.add_argument('--no-sandbox')
        chrome_options.add_argument('--disable-dev-shm-usage')
        chrome_options.add_argument('--disable-gpu')
        
        print("📋 Criando driver do Chrome...")
        driver = webdriver.Chrome(options=chrome_options)
        
        # Testa navegação para SauceDemo
        print("🌐 Navegando para SauceDemo...")
        driver.get("https://www.saucedemo.com")
        
        # Verifica se os elementos de login estão presentes
        print("🔎 Verificando elementos de login...")
        wait = WebDriverWait(driver, 10)
        
        username_field = wait.until(EC.presence_of_element_located((By.ID, "user-name")))
        password_field = driver.find_element(By.ID, "password") 
        login_button = driver.find_element(By.ID, "login-button")
        
        print("✅ Elementos encontrados:")
        print(f"   - Campo usuário: {username_field.tag_name} (id=user-name)")
        print(f"   - Campo senha: {password_field.tag_name} (id=password)")
        print(f"   - Botão login: {login_button.tag_name} (id=login-button)")
        
        # Teste básico de preenchimento
        print("📝 Testando preenchimento dos campos...")
        username_field.send_keys("standard_user")
        password_field.send_keys("secret_sauce")
        
        print("🖱️  Clicando no botão de login...")
        login_button.click()
        
        # Aguarda redirecionamento
        wait.until(EC.url_contains("inventory.html"))
        current_url = driver.current_url
        
        print(f"🎉 Login realizado com sucesso!")
        print(f"   URL atual: {current_url}")
        
        driver.quit()
        print("\n✅ SELENIUM CONFIGURADO CORRETAMENTE!")
        print("   Você pode executar os testes do Robot Framework.")
        return True
        
    except Exception as e:
        print(f"\n❌ ERRO NA CONFIGURAÇÃO: {str(e)}")
        print("\n🔧 POSSÍVEIS SOLUÇÕES:")
        print("   1. Instalar ChromeDriver:")
        print("      sudo apt install chromium-driver")
        print("   2. Ou baixar de: https://chromedriver.chromium.org/")
        print("   3. Verificar se está no PATH:")
        print("      which chromedriver")
        print("   4. Instalar Chromium:")
        print("      sudo apt install chromium-browser")
        return False

if __name__ == "__main__":
    print("=" * 60)
    print("🤖 TESTE DE CONFIGURAÇÃO SELENIUM + ROBOT FRAMEWORK")
    print("=" * 60)
    
    success = test_selenium_setup()
    
    if success:
        print("\n🚀 Para executar os testes do Robot Framework:")
        print("   cd /home/usuario/Documentos/robotframework/teste-api-robotframework-01")
        print("   source venv/bin/activate")  
        print("   robot tests/login_web_test.robot")
    
    sys.exit(0 if success else 1)