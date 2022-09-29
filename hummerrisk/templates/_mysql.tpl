{{/*
db config
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
{{- required "A valid .Values.externalMySQL.password entry required!" .Values.externalMySQL.password | quote -}}
{{- else }}
{{- required "A valid .Values.mysql.rootPassword entry required!"  .Values.mysql.rootPassword | quote -}}
{{- end }}
{{- end }}

{{- define "db.database" -}}
{{- if .Values.externalMySQL.enabled }}
{{- default "hummerrisk" .Values.externalMySQL.database }}
{{- else }}
{{- default "hummerrisk" }}
{{- end }}
{{- end }}