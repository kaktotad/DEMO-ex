#!/bin/bash

# --- Переменные для экзамена (меняйте под каждый вариант) ---
NETWORK_ID="192.168.0.0"  # Идентификатор сети
SUBNET_MASK="24"           # Маска подсети 
VLAN100_RANGE="64"         # Количество адресов в VLAN100
VLAN200_RANGE="16"         # Количество адресов в VLAN200
MGMT_VLAN="999"            # VLAN для управления

# --- Автоматический расчет IP ---
GW_IP="${NETWORK_ID%.*}.1"  # Шлюз (первый адрес)
HQ_SRV_IP="${NETWORK_ID%.*}.2"
HQ_CLI_IP="${NETWORK_ID%.*}.3"

# --- Вывод информации ---
echo "Настройка сети:"
echo "- Сеть: $NETWORK_ID/$SUBNET_MASK"
echo "- Шлюз: $GW_IP"
echo "- HQ-SRV: $HQ_SRV_IP"
echo "- HQ-CLI: $HQ_CLI_IP"
echo "- VLAN100: до $VLAN100_RANGE хостов"
echo "- Управление: VLAN $MGMT_VLAN"

# --- Пример применения (для маршрутизатора) ---
echo "Настройка интерфейсов:"
echo "ip addr add $GW_IP/$SUBNET_MASK dev eth0"
echo "ip link set eth0 up"
