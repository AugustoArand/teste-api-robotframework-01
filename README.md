# 🤖 Projeto de Testes Automatizados com Robot Framework

## 📖 Descrição do Projeto

Este projeto implementa uma **suíte de testes automatizados** usando **Robot Framework** para validação de funcionalidades web. O foco principal é a automação de testes de autenticação (login) em aplicações web, utilizando boas práticas de organização de código e configuração flexível.

O projeto está estruturado para suportar testes em múltiplos ambientes e utiliza o site [SauceDemo](https://www.saucedemo.com) como aplicação de exemplo para demonstrar as capacidades de automação.

## 🎯 Objetivo

- **Automação de testes de interface web** focados em autenticação
- **Demonstração de boas práticas** em estruturação de projetos Robot Framework
- **Configuração flexível** através de arquivos YAML
- **Keywords reutilizáveis** para diferentes cenários de teste
- **Validação de diferentes estados** de login (sucesso, falha, campos vazios, etc.)

## 🏗️ Estrutura do Projeto

```
teste-api-robotframework-01/
├── 📁 config/                     # Configurações do projeto
│   ├── auth.yaml                  # Credenciais de teste
│   ├── environments.yaml         # Configurações por ambiente
│   └── loginScreen.yaml          # Mapeamento de elementos da tela
├── 📁 docs/                      # Documentação
│   └── RESUMO_IMPLEMENTACAO.md   # Resumo técnico da implementação
├── 📁 resources/                 # Recursos compartilhados
│   └── keywords/                 # Keywords customizadas
│       └── auth_keywords.robot   # Keywords de autenticação
├── 📁 tests/                     # Casos de teste
│   └── autenticacao.robot        # Testes de login
├── requirements.txt              # Dependências Python
├── test_selenium_setup.py       # Script de verificação do ambiente
└── README.md                     # Este arquivo
```

## 🔧 Bibliotecas e Tecnologias Utilizadas

### 📚 Bibliotecas Principais

| Biblioteca | Versão | Descrição |
|------------|--------|-----------|
| **robotframework** | 7.3.2 | Framework principal para automação de testes |
| **robotframework-requests** | 0.9.7 | Extensão para testes de API REST |
| **SeleniumLibrary** | - | Automação de testes web (integrada via Robot Framework) |

### 🧰 Bibliotecas de Suporte

| Biblioteca | Versão | Função |
|------------|--------|---------|
| **PyYAML** | 6.0.3 | Manipulação de arquivos de configuração YAML |
| **requests** | 2.32.5 | Cliente HTTP para requisições (base para robotframework-requests) |
| **certifi** | 2025.10.5 | Certificados SSL/TLS |
| **charset-normalizer** | 3.4.4 | Detecção de encoding |
| **idna** | 3.11 | Suporte a domínios internacionalizados |
| **urllib3** | 2.5.0 | Cliente HTTP de baixo nível |

### 🌐 Bibliotecas Robot Framework Utilizadas

```robotframework
# Bibliotecas integradas do Robot Framework
Library    SeleniumLibrary        # Automação web
Library    Collections           # Manipulação de listas e dicionários
Library    OperatingSystem       # Operações do sistema operacional
Library    yaml                  # Processamento de arquivos YAML
```

## ⚙️ Justificativas das Escolhas Tecnológicas

### 🤖 **Robot Framework 7.3.2**
- **Linguagem natural**: Sintaxe legível para testes comportamentais
- **Extensibilidade**: Suporte a bibliotecas Python e Java
- **Relatórios ricos**: Geração automática de logs e relatórios HTML
- **Comunidade ativa**: Grande ecossistema e documentação

### 🌐 **SeleniumLibrary**
- **Padrão da indústria**: Ferramenta mais utilizada para automação web
- **Suporte multi-browser**: Chrome, Firefox, Safari, Edge
- **Integração nativa**: Funciona perfeitamente com Robot Framework
- **Maturidade**: Biblioteca estável e bem documentada

### 🔄 **robotframework-requests 0.9.7**
- **Testes de API**: Preparação para expansão para testes de API REST
- **Flexibilidade**: Suporte completo ao protocolo HTTP
- **Integração**: Combina naturalmente com testes web

### 📄 **PyYAML 6.0.3**
- **Configuração externa**: Separação de dados dos testes
- **Legibilidade**: Formato mais limpo que JSON ou XML
- **Flexibilidade**: Suporte a estruturas complexas de dados

## 🚀 Funcionalidades Implementadas

### 🔐 **Testes de Autenticação**
- ✅ Login com credenciais válidas
- ✅ Login com credenciais inválidas
- ✅ Validação de campos obrigatórios
- ✅ Testes com diferentes tipos de usuário

### 🧩 **Keywords Reutilizáveis**
- `Abrir Navegador Para Login`: Configuração inicial do browser
- `Preencher Campo Usuario`: Preenchimento do campo usuário
- `Preencher Campo Senha`: Preenchimento do campo senha
- `Clicar Botao Login`: Ação de submissão do formulário
- `Validar Login Sucesso Web`: Verificação de login bem-sucedido
- `Validar Login Falha Web`: Verificação de falhas de login

### 📊 **Configuração Flexível**
- **Ambientes**: dev, homolog, prod
- **Credenciais**: Usuários válidos e inválidos
- **Elementos**: Mapeamento de IDs dos elementos da tela

## 🏃‍♂️ Como Executar

### 📋 **Pré-requisitos**
```bash
# Python 3.8 ou superior
python --version

# Git para versionamento
git --version
```

### 🔧 **Instalação**
```bash
# 1. Clonar o repositório
git clone <url-do-repositorio>
cd teste-api-robotframework-01

# 2. Criar ambiente virtual
python -m venv venv

# 3. Ativar ambiente virtual
source venv/bin/activate  # Linux/Mac
# ou
venv\Scripts\activate     # Windows

# 4. Instalar dependências
pip install -r requirements.txt
```

### ✅ **Verificar Configuração**
```bash
# Verificar se Selenium está funcionando
python test_selenium_setup.py
```

### 🧪 **Executar Testes**
```bash
# Executar todos os testes
robot tests/

# Executar teste específico
robot tests/autenticacao.robot

# Executar com tags específicas
robot --include exemplo tests/

# Executar em modo headless
robot --variable headless:True tests/
```

### 📊 **Visualizar Resultados**
Após a execução, os seguintes arquivos são gerados:
- `report.html` - Relatório detalhado dos testes
- `log.html` - Log detalhado da execução
- `output.xml` - Dados estruturados da execução

## 🔧 Configuração

### 🔑 **Credenciais (config/auth.yaml)**
```yaml
valid_login:
  username: standard_user
  password: secret_sauce

invalid_login:
  username: usuario_invalido
  password: senha_errada
```

### 🌍 **Ambientes (config/environments.yaml)**
```yaml
environments:
  dev:
    base_url: "https://www.saucedemo.com/v1/"
    timeout: 30
    retry_count: 3
```

### 🎯 **Elementos (config/loginScreen.yaml)**
```yaml
login_form:
  username_field: user-name
  password_field: password
  submit_button: login-button
```

## 📈 Próximas Funcionalidades

- [ ] **Testes de API REST** usando robotframework-requests
- [ ] **Testes de regressão visual** 
- [ ] **Integração com CI/CD** (Jenkins, GitHub Actions)
- [ ] **Testes de performance** básicos
- [ ] **Cobertura de mais cenários** de negócio
- [ ] **Relatórios customizados** com métricas específicas

## 🤝 Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto é destinado para fins educacionais e de demonstração.

## 👨‍💻 Autor

Desenvolvido como exemplo prático de implementação de testes automatizados com Robot Framework.

---

**📧 Dúvidas ou sugestões?** Abra uma issue no repositório!