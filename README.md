<div align="center">

<img src="https://companieslogo.com/img/orig/DLB.D-4a833e8b.png?t=1720244491" width="180"/>

# Dolby Atmos support for AOSP-based ROMs

**𝚟𝚎𝚗𝚍𝚘𝚛/𝚕𝚞𝚗𝚊𝚛𝚒𝚜/𝚍𝚘𝚕𝚋𝚢**

![Android](https://img.shields.io/badge/Android-AOSP-3DDC84?style=flat-square&logo=android&logoColor=white)
![License](https://img.shields.io/badge/License-Apache%202.0-blue?style=flat-square)
![Maintained](https://img.shields.io/badge/Maintained-Yes-success?style=flat-square)

</div>

---

## Overview

This repository provides Dolby Atmos blobs and the **LunarisDolby** app for AOSP-based custom ROMs on Xiaomi devices. It includes ODM-partition HAL blobs (`_v3_6` and `_sp` stacks), the full LunarisDolby UI, and per-device sound memory — which automatically remembers and restores your complete Dolby settings for each audio output device independently.

---

## Features

- 🎧 **Per-device sound memory** — Every setting (EQ, profile, enhancers) is automatically saved and restored per device, including unsaved changes
- 🎵 **LunarisDolby UI** — Modern Dolby Atmos control app with 10/15/20-band EQ, presets, and more
- 🔊 **Full HAL support** — Both `vendor.dolby_v3_6` and `vendor.dolby_sp` ODM HAL stacks included
- ⚙️ **Plug and play** — Minimal device tree changes required

---

## Integration

### 1. Clone the repository

```bash
git clone <this-repo> vendor/lunaris/dolby
```

Or add to your local manifest:

```xml
<project path="vendor/lunaris/dolby" name="your-org/vendor_lunaris_dolby" remote="github" />
```

---

### 2. Device makefile — `device.mk`

```makefile
$(call inherit-product, vendor/lunaris/dolby/dolby.mk)
```

---

### 3. Board config — `BoardConfig.mk`

```makefile
include vendor/lunaris/dolby/BoardConfigDolby.mk
```

> **⚠️ Important:** Make sure `DEVICE_MANIFEST_FILE` and `DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE` use `+=` not `:=` in your device tree to avoid overriding the Dolby VINTF entries.

---

### 4. VINTF manifests

```makefile
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    vendor/lunaris/dolby/vintf/dolby_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += \
    vendor/lunaris/dolby/vintf/dolby_manifest.xml
```

---

### 5. Media codecs — `media_codecs_*.xml`

```xml
<Include href="media_codecs_dolby_audio.xml" />
```

---

### 6. Audio effects — `audio_effects.xml`

Add the libraries:

```xml
<library name="dap_sw" path="libswdap_v3_6.so"/>
<library name="dap_hw" path="libhwdap_v3_6.so"/>
```

Add the effect proxy:

```xml
<effectProxy name="dap" library="proxy" uuid="9d4921da-8225-4f29-aefa-39537a04bcaa">
    <libsw library="dap_sw" uuid="6ab06da4-c516-4611-8166-452799218539"/>
    <libhw library="dap_hw" uuid="a0c30891-8246-4aef-b8ad-d53e26da0253"/>
</effectProxy>
```

---

## Notes

- Not intended for devices with 64-bit audio support. 64-bit audio FX modules can be added separately if needed.
- Blobs are extracted from the ODM partition and target SM6375-based Xiaomi devices.

---

## Credits

<table>
<tr>
<td align="center" width="50%">

**[Pong-Development/hardware_dolby](https://github.com/Pong-Development/hardware_dolby)**

Original LunarisDolby UI and hardware Dolby HAL integration this repo is based on.

</td>
<td align="center" width="50%">

**[Paranoid Android / AOSPA](https://github.com/AOSPA)**

Original Dolby audio effect interface (`DolbyAudioEffect`) and base infrastructure.

</td>
</tr>
</table>

---

<div align="center">

*Maintained for [Lunaris OS](https://github.com/Lunaris-AOSP) · Licensed under [Apache 2.0](LICENSE)*

</div>
