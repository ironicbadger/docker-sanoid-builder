# IronicBadger/docker-sanoid-builder

* [Sanoid upstream project](https://github.com/jimsalterjrs/sanoid)
  * Sanoid is a policy-driven snapshot management tool for ZFS filesystems. When combined with the Linux KVM hypervisor, you can use it to make your systems functionally immortal.

This container will allow you to build Sanoid from source and generates a `.deb` file without installing any build dependencies on your system.

### Usage

```
./build.sh
sudo dpkg -i sanoid*.deb
```

The build script spins up a container, executes the `Dockerfile` which performs the actual build from source. The script then copies the built `.deb` artifact out onto your local system ready for installation using `dpkg`.