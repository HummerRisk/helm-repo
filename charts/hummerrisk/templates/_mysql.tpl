{{/*
MYSQL config
*/}}

{{- define "db.port" -}}
{{- if .Values.externalMySQL.enabled }}
{{- default 3306 .Values.externalMySQL.port }}
{{- else }}
{{- default 3306 }}
{{- end }}
{{- end }}

{{- define "db.host" -}}
{{- if .Values.externalMySQL.enabled }}
{{- default "hummerrisk-mysql" .Values.externalMySQL.host }}
{{- else }}
{{- include "hummerrisk.fullname" . }}-mysql
{{- end }}
{{- end }}

{{- define "db.username" -}}
{{- if .Values.externalMySQL.enabled }}
{{- default "root" .Values.externalMySQL.username }}
{{- else }}
{{- default "root" }}
{{- end }}
{{- end }}

{{- define "db.password" -}}
{{/*
define a random password
*/}}
{{- if .Values.externalMySQL.enabled }}
{{- required "A valid .Values.externalMySQL.password entry required!" .Values.externalMySQL.password -}}
{{- else }}
{{- required "A valid .Values.mysql.rootPassword entry required!"  .Values.mysql.rootPassword -}}
{{- end }}
{{- end }}

{{- define "db.database" -}}
{{- if .Values.externalMySQL.enabled }}
{{- default "hummerrisk" .Values.externalMySQL.database }}
{{- else }}
{{- default "hummerrisk" }}
{{- end }}
{{- end }}

{{/* Redis setting*/}}
{{- define "redis.host" -}}
{{- if .Values.externalRedis.enabled }}
{{- default "hummerrisk" .Values.externalRedis.host }}
{{- else }}
{{- include "hummerrisk.fullname" . }}-redis
{{- end }}
{{- end }}

{{- define "redis.port" -}}
{{- if .Values.externalRedis.enabled }}
{{- default 6379 .Values.externalRedis.port }}
{{- else }}
{{- default 6379 }}
{{- end }}
{{- end }}


{{- define "redis.password" -}}
{{/*
define a random password
*/}}
{{- if .Values.externalMySQL.enabled }}
{{- required "A valid .Values.externalRedis.password entry required!" .Values.externalRedis.password -}}
{{- else }}
{{- required "A valid .Values.redis.password entry required!"  .Values.redis.password -}}
{{- end }}
{{- end }}


{{- define "nacos.host" -}}
{{- if .Values.nacos.host }}
{{- default "hummerrisk-nacos" .Values.externalMySQL.database }}
{{- else }}
{{- include "hummerrisk.fullname" . }}-nacos
{{- end }}
{{- end }}