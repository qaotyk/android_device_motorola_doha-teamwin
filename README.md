<p align="left"> Copyright 2016 - 2021 The LinegeOS Project </p>
<h1 align="left"> TWRP Device configuration for Motorola G8 Plus (doha) </h1>

<p align="center">
  <img height="600" src="/doha.jpg?raw=true">
</p>

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (2x2.0 GHz Kryo 460 Gold & 6x1.7 GHz Kryo 460 Silver)
CHIPSET | Qualcomm Trinket Snapdragon 665
Resolution | 1080 * 2280
GPU     | Adreno 610
Memory  | 4 GB
Shipped Android Version | 9.0 (Pie)
Storage | 64 / 128 GB
Battery | 4000 mAh
Dimensions | 158.4 x 75.8 x 9.1 mm
Display | 1080 x 2280 pixels, 6.3" IPS FullHD+
Rear Camera  | 48 MP (f/1.7) + 16 MP (f/2.2) + 5 MP (f/2.2) (PDAF, OIS)
Front Camera | 25 MP (f/2.0)
Treble | A / B

## Build instructions
- Initialize the source tree -
  ```bash
  repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
  ```
  You may optionally pass `--depth=1` to save space, like so:
  ```bash
  repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
  ```
- Clone this repository -
  ```bash
  git clone https://github.com/trinket-common/recovery_motorola_doha device/motorola/doha
  ```

- Clone the kernel repository -
  ```bash
  git clone -b twrp-10 https://github.com/trinket-common/kernel_motorola_sm6125 kernel/motorola/sm6125
  ```

- Build -
  ```bash
  source build/envsetup.sh
  export ALLOW_MISSING_DEPENDENCIES=true
  lunch omni_doha-eng
  mka recoveryimage -j$(nproc --all)
  ```
- Test build -
  ```bash
  cd out/target/product/doha
  fastboot boot recovery.img
  ```

## Copyright
```bash
 /*
 *  Copyright (C) 2013 - 2021 The OmniROM Project
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
 ```
