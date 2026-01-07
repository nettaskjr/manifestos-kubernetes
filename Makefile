.PHONY: help install-all delete-all

help:
@echo "🛠️  Comandos disponíveis no Home Lab Kubernetes"
@echo ""
@echo "📦 Instalação:"
@echo "  make install-all        - Sobe TODA a infraestrutura"
@echo "  make install-monitoring - Sobe Prometheus, Grafana, Loki (k8s-monitoring)"
@echo "  make install-db         - Sobe Bancos de Dados (db)"
@echo "  make install-automation - Sobe n8n (Automation)"
@echo "  make install-ai         - Sobe Ollama + WebUI (LLM)"
@echo "  make install-server     - Sobe Nginx (Server)"
@echo "  make install-outros     - Sobe utilitários (Outros)"
@echo "  make install-portainer  - Sobe o Portainer (Raiz)"
@echo ""
@echo "🔥 Remoção:"
@echo "  make delete-all         - Remove TODA a infraestrutura"
@echo "  make delete-monitoring  - Remove stack de monitoramento"
@echo "  make delete-db          - Remove bancos de dados"
@echo "  make delete-automation  - Remove n8n"
@echo "  make delete-ai          - Remove IA"
@echo "  make delete-server      - Remove web servers"
@echo "  make delete-outros      - Remove utilitários"
@echo "  make delete-portainer   - Remove Portainer"

# --- Instalação ---

install-all: install-portainer install-monitoring install-db install-automation install-ai install-server install-outros
@echo "✅ Toda a infraestrutura foi solicitada!"

install-monitoring:
@echo "📊 Instalando Monitoramento..."
kubectl apply -f k8s-monitoring/

install-db:
@echo "🗄️  Instalando Banco de Dados..."
kubectl apply -f db/

install-automation:
@echo "🤖 Instalando Automação..."
kubectl apply -f automation/

install-ai:
@echo "🧠 Instalando IA..."
kubectl apply -f llm/

install-server:
@echo "�� Instalando Servidores Web..."
kubectl apply -f server/

install-outros:
@echo "🔧 Instalando Utilitários..."
kubectl apply -f outros/

install-portainer:
@echo "🚢 Instalando Portainer..."
kubectl apply -f portainer.yaml

# --- Remoção ---

delete-all: delete-outros delete-server delete-ai delete-automation delete-db delete-monitoring delete-portainer
@echo "🔥 Tudo removido!"

delete-monitoring:
kubectl delete -f k8s-monitoring/ --ignore-not-found

delete-db:
kubectl delete -f db/ --ignore-not-found

delete-automation:
kubectl delete -f automation/ --ignore-not-found

delete-ai:
kubectl delete -f llm/ --ignore-not-found

delete-server:
kubectl delete -f server/ --ignore-not-found

delete-outros:
kubectl delete -f outros/ --ignore-not-found

delete-portainer:
kubectl delete -f portainer.yaml --ignore-not-found
