Copyright (C) TeamVee-SS
=============================================

This is the Android device configuration for Xperia E1.

To setup a tree and build images for the device do the following:

Put the following snippet in `.repo/local_manifests/falconss.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project path="device/sony/falconss" name="Caio99BR/android_device_sony_falconss" revision="cm-11.0" />
  <project path="kernel/sony/falconss" name="Caio99BR/android_kernel_sony_falconss" revision="master"/>
</manifest>
```

Unfortunately the vendor binaries not is complete for now, and not is provided by Sony of easy way.

* `repo sync`
* `source ./build/envsetup.sh`
* `breakfast falconss`
* `make`

To flash the images produced make sure your device is unlocked, as described on
http://unlockbootloader.sonymobile.com/

The readme is imcomplete, and will be updated soon.
