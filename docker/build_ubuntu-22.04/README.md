sscanf Linux build image (Ubuntu 22.04)
=======================================

Used by `docker/build.sh`. Prefer calling that script from the `docker/` directory:

```bash
UBUNTU_VERSION=22.04 ./build.sh
```

Build type defaults to `RelWithDebInfo`. Override with `-e CONFIG=Release` / `Debug`.
