sscanf Linux build image (Ubuntu 24.04 LTS)
===========================================

Used by `docker/build.sh` (default Ubuntu version):

```bash
./build.sh
# or explicitly:
UBUNTU_VERSION=24.04 ./build.sh
```

Build type defaults to `RelWithDebInfo`. Override with `CONFIG=Release` / `Debug`.
