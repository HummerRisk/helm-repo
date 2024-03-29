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
{{- end }}h

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
{{- default "hummer_risk" .Values.externalMySQL.database }}
{{- else }}
{{- default "hummer_risk" }}
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



{{/* nacos config*/}}

{{- define "nacos.host" -}}
{{- if .Values.nacos.host }}
{{- required "A valid .Values.nacos.host entry required!" .Values.nacos.host }}
{{- else }}
{{- include "hummerrisk.fullname" . }}-nacos-headless
{{- end }}
{{- end }}

{{- define "nacos.db" -}}
{{- if .Values.nacos.host }}
{{- default "hummer_config" .Values.nacos.host }}
{{- else }}
{{- default "hummer_config" }}
{{- end }}
{{- end }}