#!/bin/bash

set -e

# Названия
NAMESPACE="v2ray"
RELEASE="v2ray"
CHART_DIR="./v2ray"  # путь где у тебя чартик лежит
VALUES_FILE="$CHART_DIR/values.yaml"

# Создать неймспейс если его нет
kubectl get ns $NAMESPACE >/dev/null 2>&1 || kubectl create ns $NAMESPACE

# Деплой чарта
helm upgrade --install $RELEASE $CHART_DIR \
  --namespace $NAMESPACE \
  --create-namespace \
  -f $VALUES_FILE

echo "✅ V2Ray успешно задеплоен в namespace: $NAMESPACE"
