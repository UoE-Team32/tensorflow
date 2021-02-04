# Build TensorFlow 2.x for AArch64/Arm64 w/tk using Docker

Before using this project run the uname command to confirm the machine is aarch64 or arm64. Other architectures will not work.

```
> uname -m
aarch64 || arm64
```

## Building Image

```
> docker build --build-arg njobs=$(nproc) -t tensorflow-arm-tk .
```
