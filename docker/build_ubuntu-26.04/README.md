sscanf Linux build image (Ubuntu 26.04 LTS)
===========================================

Used by `docker/build.sh`:

```bash
UBUNTU_VERSION=26.04 ./build.sh
```

Build type defaults to `RelWithDebInfo`. Override with `CONFIG=Release` / `Debug`.
