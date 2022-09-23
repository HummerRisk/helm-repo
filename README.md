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
    helm install hummerrisk hummerrisk/hummerrisk -n hummer -f values.yaml
```

# 配置参数说明
通过修改 vales.yaml 文件可以修改HummerRisk安装参数，例如：端口、存储信息等
```yaml
global:
  imageRegistry: "registry.cn-beijing.aliyuncs.com"
  ## E.g.
  ## imagePullSecrets:
  ##   - myRegistryKeySecretName
  ##
  imageTag: v0.3.1
  imagePullSecrets: []
  imagePullPolicy: Always
  storageClass: "default"
```