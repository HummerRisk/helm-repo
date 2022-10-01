# Hummerrisk helm-chart

- Kubernetes 1.20 +
- Helm 3.0

# 使用

1. 添加仓库源
```shell
    helm add repo hummerrisk https://hummerrisk.github.io/helm-repo
```

2. 更新 helm 仓库
```shell
    helm repo list
    helm repo update
```

3. 安装HummerRisk
```shell
    # 查询
    helm search repo hummerrisk
    # 安装
    helm install hummerrisk hummerrisk/hummerrisk -n hummer --create-namespace
```

4. 更新hummerrisk
```shell
    # 更新某个配置项，例如修改 Service 类型为 NodePort
    helm upgrade hummerrisk hummerrisk/hummerrisk --set hummerrisk.serviceType=NodePort -ndev
    # 更新 hummerrisk
    helm upgrade --install -n hummer hummerrisk hummerrisk/hummerrisk [--version 0.3.3 ] [-f values.yaml]
```

# 配置参数说明
通过修改 vales.yaml 文件或者 helm --set 可以修改HummerRisk安装参数，例如：端口、存储信息等，以下为默认配置项，可根据实际环境修改。
```yaml
# 全局配置
global:
  imageRegistry: "registry.cn-beijing.aliyuncs.com"
  ## E.g.
  ## imagePullSecrets:
  ##   - myRegistryKeySecretName
  ##
  imageTag: v0.3.1
  imagePullSecrets: []
  imagePullPolicy: Always
  ## 指定存储类
  storageClass: "nfs"

# hummerrisk 配置项
hummerrisk:
  image:
    repository: nginx
    pullPolicy: IfNotPresent
    # Overrides the image tag whose default is the chart appVersion.
    tag: v0.3.2
  replicas: 1
  # servicePort is the HTTP listener port for the webserver
  servicePort: 80
  serviceType: ClusterIP
  sessionAffinity: ClientIP

# 外部数据库信息
externalMySQL:
  enabled: false
  host: mysql.local
  port: 3306
  username: root
  password: ""
  database: ""

# 存储卷配置
storage:
  logSize: 20Gi
  imageSize: 30Gi
  fileSize: 10Gi
  dbSize: 50Gi
  accessModes:
    - ReadWriteMany
```