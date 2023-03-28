{{ if .Values.mysql.enabled }}
# Source: mysql/templates/primary/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: hummerrisk-mysql-init
  namespace: {{ .Release.Namespace | quote }}
  labels:
    app.kubernetes.io/name: mysql
data:
  init.sql: |-
    CREATE DATABASE IF NOT EXISTS hummerrisk DEFAULT CHARACTER SET utf8mb4;
    CREATE DATABASE IF NOT EXISTS hummer_config DEFAULT CHARACTER SET utf8mb4;
{{ end }}