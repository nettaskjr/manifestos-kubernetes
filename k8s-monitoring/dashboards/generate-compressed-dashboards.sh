#!/bin/bash

# Diretórios (script dentro da pasta dashboards)
DASHBOARDS_DIR="."
OUTPUT_FILE="../09-grafana-dashboards-compressed.yaml"
NAMESPACE="monitoring"

echo "Gerando ConfigMap com dashboards comprimidos..."

# Início do YAML
cat <<EOF > $OUTPUT_FILE
apiVersion: v1
kind: ConfigMap
metadata:
  name: grafana-dashboards-compressed
  namespace: $NAMESPACE
binaryData:
EOF

# Processa cada arquivo JSON
for f in $DASHBOARDS_DIR/*.json; do
    filename=$(basename "$f")
    # Comprime com gzip e converte para base64 (sem quebras de linha)
    content=$(gzip -c "$f" | base64 -w 0)
    echo "  $filename.gz: $content" >> $OUTPUT_FILE
    echo "Processado: $filename"
done

echo "Concluído! Arquivo gerado: $OUTPUT_FILE"
