# ☸️ Manifesto Kubernetes (Home Lab)

![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

Este repositório contém uma coleção curada de manifestos Kubernetes projetada para transformar um cluster simples (como K3s na Oracle Cloud) em uma plataforma poderosa de **Engenharia de Dados, Automação e IA**.

A estrutura foi pensada para ser modular, permitindo que você suba apenas os serviços que precisa, quando precisa.

---

## 📂 Organização dos Diretórios

Abaixo, a estrutura física do projeto. Cada diretório agora corresponde a uma aplicação ou stack específica:

```text
.
├── 📂 Chatwoot/                   # [NOVO] Atendimento ao cliente Open Source
├── 📂 EvolutionAPI/               # [NOVO] API de WhatsApp
├── 📂 k8s-error-page/             # Página de Erro 404 personalizada
├── 📂 k8s-monitoring/             # Stack de Observabilidade (Prometheus, Grafana, Loki)
├── 📂 MinIO/                      # [NOVO] Object Storage (S3 Compatible)
├── 📂 n8n/                        # Automação: n8n Workflow Automation
├── 📂 Nginx/                      # Servidor Web: Nginx
├── 📂 Ollama/                     # IA: Ollama + Open WebUI (antigo llm)
├── 📂 Portainer/                  # Gerenciamento: Portainer
├── 📂 PostgreSQL/                 # Banco de Dados: PostgreSQL
├── 📂 Qdrant/                     # Banco de Dados Vetorial: Qdrant
├── 📂 RabbitMQ/                   # [NOVO] Message Broker
├── 📂 Redis/                      # Cache: Redis
├── 📂 Supabase/                   # Backend as a Service: Supabase
├── 📂 Whoami/                     # Utilitário: Whoami (teste de conexão)
└── 📄 Makefile                    # Atalhos para instalação/remoção
```

---

## 🚀 Guia de Aplicações

Abaixo, um resumo do que cada stack proporciona:

### 1. Administração & Monitoramento
![Portainer](https://img.shields.io/badge/Portainer-00bcf2?style=for-the-badge&logo=portainer&logoColor=white) ![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=Prometheus&logoColor=white) ![Grafana](https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white)

*   **Portainer** (`Portainer/`): Interface gráfica para gerenciar seu cluster.
*   **Observabilidade** (`k8s-monitoring/`): Stack completa com Prometheus (métricas), Grafana (dashboards), Loki (logs) e Promtail.
*   **Error Page** (`k8s-error-page/`): Tratamento elegante de erros 404 para o cluster.

### 2. Automação, CRM & Mensageria
![n8n](https://img.shields.io/badge/n8n-EA4B71?style=for-the-badge&logo=n8n&logoColor=white) ![Chatwoot](https://img.shields.io/badge/Chatwoot-00A9F4?style=for-the-badge) ![RabbitMQ](https://img.shields.io/badge/RabbitMQ-FF6600?style=for-the-badge&logo=rabbitmq&logoColor=white)

*   **n8n** (`n8n/`): Ferramenta de automação de fluxo de trabalho.
*   **Chatwoot** (`Chatwoot/`): Plataforma de engajamento do cliente (Omnichannel).
*   **EvolutionAPI** (`EvolutionAPI/`): API para integração com WhatsApp.
*   **RabbitMQ** (`RabbitMQ/`): Broker de mensagens para aplicações distribuídas.

### 3. Backend & Storage
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white) ![MinIO](https://img.shields.io/badge/MinIO-C72C48?style=for-the-badge&logo=minio&logoColor=white)

*   **Supabase** (`Supabase/`): Alternativa open-source ao Firebase.
*   **MinIO** (`MinIO/`): Armazenamento de objetos compatível com S3 (High Performance).

### 4. Inteligência Artificial
![Ollama](https://img.shields.io/badge/Ollama-000000?style=for-the-badge&logo=ollama&logoColor=white)

*   **LLM Stack** (`Ollama/`): Ollama (backend de inferência) + Open WebUI.

### 5. Bancos de Dados & Cache
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white) ![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white) ![Qdrant](https://img.shields.io/badge/Qdrant-D51F45?style=for-the-badge)

*   **PostgreSQL** (`PostgreSQL/`): Banco de dados relacional.
*   **Redis** (`Redis/`): Cache em memória.
*   **Qdrant** (`Qdrant/`): Banco de dados vetorial.

### 6. Web & Utilitários
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

*   **Nginx** (`Nginx/`): Servidor web.
*   **Whoami** (`Whoami/`): Container leve para testes.

---

## 🛠️ Como Executar

### Passo 1: Personalização
Verifique os arquivos `.yaml` em cada pasta. Procure por comentários `# MUDE AQUI` para ajustar domínios (Ingress) e senhas.

### Passo 2: Aplicação
Use o `Makefile` para facilitar a vida.

**Usando Make (Recomendado):**
```bash
make help               # Lista todos os comandos
make install-all        # Instala TUDO
make install-monitoring # Instala apenas monitoramento
make install-n8n        # Instala apenas n8n
make install-chatwoot   # Instala Chatwoot (novo)
# ... e assim por diante
```

**Manual:**
```bash
kubectl apply -f k8s-monitoring/
kubectl apply -f Qdrant/
kubectl apply -f Ollama/
```

### Verificando o Status
```bash
kubectl get pods -A
```

---

## 🔗 Acessos Padrão

Se configurado corretamente com seu domínio e Ingress:

*   **Portainer**: `https://portainer.seudominio.com.br`
*   **Grafana**: `https://grafana.seudominio.com.br`
*   **n8n**: `https://n8n.seudominio.com.br`
*   **Open WebUI**: `https://chat.seudominio.com.br`
*   **Supabase**: `https://supabase.seudominio.com.br`
*   **Chatwoot**: (Configurar no Ingress)

> **Nota**: Certifique-se de configurar o DNS apontando para o seu cluster.