# ☸️ Manifesto Kubernetes (Home Lab)

![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

Este repositório contém uma coleção curada de manifestos Kubernetes projetada para transformar um cluster simples (como K3s na Oracle Cloud) em uma plataforma poderosa de **Engenharia de Dados, Automação e IA**.

A estrutura foi pensada para ser modular, permitindo que você suba apenas os serviços que precisa, quando precisa.

---

## 📂 Organização dos Diretórios

Abaixo, a estrutura física do projeto. Cada diretório agrupa manifestos de um domínio específico:

```text
.
├── 📂 Automation/                 # Automação de fluxos de trabalho
│   └── n8n-stack.yaml             # Stack do n8n (Deployment + Svc + Ingress)
│
├── 📂 BD/                         # Bancos de Dados e Backend
│   ├── postgres.yaml              # PostgreSQL Standalone
│   ├── qdrant.yaml                # Banco Vetorial (Qdrant)
│   ├── redis.yaml                 # Redis (Cache)
│   ├── supabase-core.yaml         # Core do Supabase (DB + Auth + API)
│   ├── supabase-full.yaml         # (Opcional) Stack completa Supabase
│   └── supabase-ingress.yaml      # Rotas de acesso ao Supabase
│
├── 📂 k8s-monitoring/             # Stack de Observabilidade Completa
│   ├── 00-namespace.yaml          # Cria o namespace 'monitoring'
│   ├── 01-loki.yaml               # Agregador de Logs
│   ├── 02-promtail.yaml           # Coletor de Logs (DaemonSet)
│   ├── 03-prometheus-rbac.yaml    # Permissões do Prometheus
│   ├── 04-prometheus-config.yaml  # Configuração de Scrape
│   ├── 05-prometheus-deployment.yaml
│   ├── 06-grafana-datasource.yaml # Conecta Grafana ao Prometheus/Loki
│   ├── 07-grafana-deployment.yaml # Dashboard Grafana
│   └── 08-grafana-dashboard-...   # Provisionamento automático de Dashboards
│
├── 📂 LLM/                        # Inteligência Artificial Local
│   └── llm-stack.yaml             # Ollama (Backend) + Open WebUI (Frontend)
│
├── 📂 Server/                     # Servidores Web
│   └── nginx.yaml                 # Nginx estático de exemplo
│
├── 📂 Outros/                     # Utilitários
│   └── whoami-stack.yaml          # Container leve para testar conexões e Ingress
│
├── 📄 portainer.yaml              # Gerenciador Visual do Cluster (Raiz)
└── 📄 README.md                   # Este arquivo
```

---

## 🚀 Guia de Aplicações (A "Pincelada")

Abaixo, um resumo do que cada stack proporciona para o seu ambiente, acompanhado das tecnologias que a compõem:

### 1. Administração & Monitoramento
![Portainer](https://img.shields.io/badge/Portainer-00bcf2?style=for-the-badge&logo=portainer&logoColor=white) ![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=Prometheus&logoColor=white) ![Grafana](https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white) ![Loki](https://img.shields.io/badge/Loki-F46800?style=for-the-badge&logo=grafana&logoColor=white)

*   **Portainer** (`portainer.yaml`): Interface gráfica intuitiva para gerenciar seu cluster Kubernetes, ver logs dos containers e gerenciar volumes sem tocar no terminal.
*   **Stack de Observabilidade** (`k8s-monitoring/`):
    *   **Prometheus**: O cérebro que coleta métricas de CPU, RAM e rede.
    *   **Grafana**: O rosto bonito que exibe essas métricas em dashboards elegantes.
    *   **Loki & Promtail**: O sistema de logs centralizado (como um "grep" para todo o cluster).

### 2. Automação & Dados
![n8n](https://img.shields.io/badge/n8n-EA4B71?style=for-the-badge&logo=n8n&logoColor=white) ![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)

*   **n8n** (`Automation/n8n-stack.yaml`): Uma ferramenta de automação de fluxo de trabalho baseada em nós. Imagine conectar o Google Sheets ao seu Banco de Dados e ao Discord sem escrever código.
*   **Supabase** (`BD/supabase-core.yaml`): Uma alternativa open-source ao Firebase. Oferece Banco de Dados Postgres, Autenticação, API Realtime e Interface de Tabela Instantânea.

### 3. Inteligência Artificial (LLM)
![Ollama](https://img.shields.io/badge/Ollama-000000?style=for-the-badge&logo=ollama&logoColor=white) ![Open WebUI](https://img.shields.io/badge/Open%20WebUI-303030?style=for-the-badge)

*   **Ollama + Open WebUI** (`LLM/llm-stack.yaml`): Execute modelos de linguagem (LLMs) como Llama 3 ou Mistral diretamente no seu servidor. O **Open WebUI** oferece uma interface estilo ChatGPT para interagir com esses modelos.

### 4. Bancos de Dados Especializados
![Qdrant](https://img.shields.io/badge/Qdrant-D51F45?style=for-the-badge) ![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

*   **Qdrant** (`BD/qdrant.yaml`): Banco de dados vetorial, essencial para criar memórias de longo prazo para seus Agentes de IA (RAG).
*   **Redis** (`BD/redis.yaml`): Cache em memória ultra-rápido, usado para filas e sessões.
*   **Postgres** (`BD/postgres.yaml`): Instância standalone do banco de dados relacional mais amado do mundo.

### 5. Web & Ingress
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white) ![Traefik](https://img.shields.io/badge/Traefik-%2303a9f4.svg?style=for-the-badge&logo=traefik&logoColor=white)

*   **Nginx** (`Server/nginx.yaml`): Servidor web de alta performance.
*   **Traefik** (Ingress Controller): O controlador de tráfego que gerencia as entradas do seu cluster (já incluso no K3s, configurado nos Ingress).

---

## 🛠️ Como Executar

Antes de aplicar os manifestos, **atenção**: muitos arquivos contêm placeholders como `<<seu-dominio>>` ou senhas padrão.

### Passo 1: Personalização
Abra os arquivos `.yaml` que deseja usar e procure por comentários como `# MUDE AQUI`.
*   Ajuste os domínios nos objetos `Ingress` para apontar para seu DNS configurado.
*   Altere senhas e chaves de API nos `ConfigMaps` ou `Secrets`.

### Passo 2: Aplicação
Use o `kubectl` para aplicar os arquivos ou diretórios inteiros.

**Exemplo: Subindo o Monitoramento**
```bash
kubectl apply -f k8s-monitoring/
```

**Exemplo: Subindo o Banco de Dados Vetorial**
```bash
kubectl apply -f BD/qdrant.yaml
```

**Exemplo: Subindo a Stack de IA**
```bash
kubectl apply -f LLM/llm-stack.yaml
```

### Verificando o Status
Após aplicar, verifique se os pods estão rodando:
```bash
kubectl get pods -A
```

---

## 🔗 Acessos Padrão

Se configurado corretamente com seu domínio e Ingress (Traefik), os serviços estarão acessíveis em:

*   **Portainer**: `https://portainer.seudominio.com.br`
*   **Grafana**: `https://grafana.seudominio.com.br` (Senha padrão geralmente definida no secret)
*   **n8n**: `https://n8n.seudominio.com.br`
*   **Open WedUI**: `https://chat.seudominio.com.br`
*   **Supabase Studio**: `https://supabase.seudominio.com.br`

> **Nota**: Certifique-se de que seu DNS (Cloudflare, etc.) esteja apontando para o IP do seu servidor/LoadBalancer.