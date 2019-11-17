# scheduler-framework-sample

This repo is a sample for Kubernetes scheduler framework. The `sample` plugin implements `filter` and `prebind` extension points. 
And the custom scheduler name is `scheduler-framework-sample` which defines in `KubeSchedulerConfiguration` object.

## Build

### binary
```shell
$ make scheduler 
```

### image
```shell
$ make image
```

## Deploy

```shell
$ kubectl apply -f ./deploy/
```
