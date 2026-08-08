

# scheduler-framework-sample

![](https://github.com/angao/scheduler-framework-sample/workflows/Go/badge.svg)

This repo is a sample for Kubernetes scheduler framework. The `sample` plugin implements `filter` and `prebind` extension points. 
And the custom scheduler name is `scheduler-framework-sample` which defines in `KubeSchedulerConfiguration` object.

## Build

### binary
```shell
$ make local
```

### image
```shell
$ make image
```

## Deploy

```shell
$ kubectl apply -f ./deploy/
```

## Usage

To schedule a pod with the custom scheduler, set the `schedulerName` field in the pod spec to `scheduler-framework-sample`. An example is provided in `config/busybox.yaml`:
```shell
$ kubectl apply -f ./config/busybox.yaml
```
