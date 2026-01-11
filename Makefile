.PHONY: help install-all install-monitoring install-portainer install-error-page install-pg install-redis install-qdrant install-supabase install-n8n install-llm install-nginx install-whoami install-chatwoot install-evolution install-minio install-rabbitmq delete-all delete-monitoring delete-portainer delete-error-page delete-pg delete-redis delete-qdrant delete-supabase delete-n8n delete-llm delete-nginx delete-whoami delete-chatwoot delete-evolution delete-minio delete-rabbitmq

help:
	@echo "🛠️  Comandos disponíveis no Home Lab Kubernetes"
	@echo ""
	@echo "📦 Instalação Geral:"
	@echo "  make install-all        - Sobe TODA a infraestrutura"
	@echo ""
	@echo "📊 Observabilidade & Gestão:"
	@echo "  make install-monitoring - Prometheus, Grafana, Loki (k8s-monitoring)"
	@echo "  make install-portainer  - Portainer (Portainer/)"
	@echo "  make install-error-page - Página de Erro 404 (k8s-error-page/)"
	@echo ""
	@echo "🗄️  Bancos de Dados & Storage:"
	@echo "  make install-pg         - PostgreSQL (PostgreSQL/)"
	@echo "  make install-redis      - Redis (Redis/)"
	@echo "  make install-qdrant     - Qdrant Vector DB (Qdrant/)"
	@echo "  make install-supabase   - Supabase Stack (Supabase/)"
	@echo "  make install-minio      - MinIO Object Storage (MinIO/)"
	@echo ""
	@echo "🤖 Automação & CRM:"
	@echo "  make install-n8n        - n8n Workflow (n8n/)"
	@echo "  make install-chatwoot   - Chatwoot CRM (Chatwoot/)"
	@echo "  make install-evolution  - EvolutionAPI WhatsApp (EvolutionAPI/)"
	@echo "  make install-rabbitmq   - RabbitMQ Broker (RabbitMQ/)"
	@echo "  make install-llm        - Ollama + Open WebUI (Ollama/)"
	@echo ""
	@echo "🌐 Web & Utilitários:"
	@echo "  make install-nginx      - Nginx Server (Nginx/)"
	@echo "  make install-whoami     - Whoami Test (Whoami/)"
	@echo ""
	@echo "🔥 Remoção:"
	@echo "  make delete-all         - Remove TODA a infraestrutura"
	@echo "  make delete-<servico>   - Remove um serviço específico (ex: delete-n8n)"

# --- Instalação ---

install-all: install-portainer install-monitoring install-error-page install-pg install-redis install-qdrant install-minio install-rabbitmq install-supabase install-n8n install-chatwoot install-evolution install-llm install-nginx install-whoami
	@echo "✅ Toda a infraestrutura foi solicitada!"

install-monitoring:
	@echo "📊 Instalando Monitoramento..."
	kubectl apply -f k8s-monitoring/

install-portainer:
	@echo "🚢 Instalando Portainer..."
	kubectl apply -f Portainer/

install-error-page:
	@echo "🚫 Instalando Página de Erro..."
	kubectl apply -f k8s-error-page/

install-pg:
	@echo "🐘 Instalando PostgreSQL..."
	kubectl apply -f PostgreSQL/

install-redis:
	@echo "⚡ Instalando Redis..."
	kubectl apply -f Redis/

install-qdrant:
	@echo "🔍 Instalando Qdrant..."
	kubectl apply -f Qdrant/

install-minio:
	@echo "🪣 Instalando MinIO..."
	kubectl apply -f MinIO/

install-rabbitmq:
	@echo "🐰 Instalando RabbitMQ..."
	kubectl apply -f RabbitMQ/

install-supabase:
	@echo "🔥 Instalando Supabase..."
	kubectl apply -f Supabase/

install-n8n:
	@echo "🤖 Instalando n8n..."
	kubectl apply -f n8n/

install-chatwoot:
	@echo "💬 Instalando Chatwoot..."
	kubectl apply -f Chatwoot/

install-evolution:
	@echo "📱 Instalando EvolutionAPI..."
	kubectl apply -f EvolutionAPI/

install-llm:
	@echo "🧠 Instalando IA (Ollama)..."
	kubectl apply -f Ollama/

install-nginx:
	@echo "🌐 Instalando Nginx..."
	kubectl apply -f Nginx/

install-whoami:
	@echo "❓ Instalando Whoami..."
	kubectl apply -f Whoami/

# --- Remoção ---

delete-all: delete-whoami delete-nginx delete-llm delete-evolution delete-chatwoot delete-n8n delete-supabase delete-rabbitmq delete-minio delete-qdrant delete-redis delete-pg delete-error-page delete-monitoring delete-portainer
	@echo "🔥 Tudo removido!"

delete-monitoring:
	kubectl delete -f k8s-monitoring/ --ignore-not-found

delete-portainer:
	kubectl delete -f Portainer/ --ignore-not-found

delete-error-page:
	kubectl delete -f k8s-error-page/ --ignore-not-found

delete-pg:
	kubectl delete -f PostgreSQL/ --ignore-not-found

delete-redis:
	kubectl delete -f Redis/ --ignore-not-found

delete-qdrant:
	kubectl delete -f Qdrant/ --ignore-not-found

delete-minio:
	kubectl delete -f MinIO/ --ignore-not-found

delete-rabbitmq:
	kubectl delete -f RabbitMQ/ --ignore-not-found

delete-supabase:
	kubectl delete -f Supabase/ --ignore-not-found

delete-n8n:
	kubectl delete -f n8n/ --ignore-not-found

delete-chatwoot:
	kubectl delete -f Chatwoot/ --ignore-not-found

delete-evolution:
	kubectl delete -f EvolutionAPI/ --ignore-not-found

delete-llm:
	kubectl delete -f Ollama/ --ignore-not-found

delete-nginx:
	kubectl delete -f Nginx/ --ignore-not-found

delete-whoami:
	kubectl delete -f Whoami/ --ignore-not-found
