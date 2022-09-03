# PadOSDC

DarkMode

|![padosdc_phone_1](https://user-images.githubusercontent.com/24838521/184555545-160d93de-aaf5-4cdc-ae51-02071a0cba8a.png)|![padosdc_phone_2](https://user-images.githubusercontent.com/24838521/184555547-75fa3a84-b040-4aa2-bee3-2155caa5d1ff.png)|![padosdc_phone_3](https://user-images.githubusercontent.com/24838521/184555548-bd6a0121-522f-4747-9157-5acf1b9f418a.png)|![padosdc_phone_4](https://user-images.githubusercontent.com/24838521/184555549-af3c82b4-9de1-46f1-9174-7cc5274173c2.png)|![padosdc_phone_7](https://user-images.githubusercontent.com/24838521/184555557-bafa23ec-fdeb-42d9-96ac-0d6fcbf94ede.png)|
|:---:|:---:|:---:|:---:|:---:|

LightMode

| <img src="https://user-images.githubusercontent.com/24838521/185480360-57b87dc8-45b5-48e0-92d9-dc61bd7325a2.png" width=200> | <img src="https://user-images.githubusercontent.com/24838521/185480365-6df85969-b0bf-4be1-b89f-e4d02cc7805b.png" width=200> | <img src="https://user-images.githubusercontent.com/24838521/185480372-817b0958-6e56-454e-9234-a798b6b15dfa.png" width=200> | <img src="https://user-images.githubusercontent.com/24838521/185480382-0feb3b75-0514-4fd6-8cb1-dad16c67cc1c.png" width=200> | <img src="https://user-images.githubusercontent.com/24838521/185480391-f32f052a-1485-4ead-a48d-848f02792263.png" width=200> |
|:---:|:---:|:---:|:---:|:---:|

Install from [here](https://apps.apple.com/us/app/padosdc/id1637969392) on App Store.

<br>

# Description

This is an unofficial application for conference of [iOSDC Japan 2022](https://iosdc.jp/2022/).

You can check and search the timetable of the conference.

It's built with *SwiftUI only*, using [Swift Playgrounds](https://www.apple.com/jp/swift/playgrounds/) instead of Xcode.

<br>

# Architecture

<img src="https://user-images.githubusercontent.com/24838521/184556411-be2fe12a-f9d1-4698-8984-cbf001d4539c.png" width=1000>

The architecture is based on `MVVM`.

Screen transitions are made via `Environment`.

<br>

# Installation

## 1. Clone

Install [Swift Playgrounds](https://www.apple.com/jp/swift/playgrounds/) and open `PadOSDC.swiftpm` that cloned following step.

```bash
$ git clone https://github.com/crane-hiromu/PadOSDC_Japan_App PadOSDC.swiftpm
```

## 2. Setup

Install [Homebrew](https://brew.sh/) if needed.

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install [LicensePlist](https://github.com/mono0926/LicensePlist) and [SwiftGen](https://github.com/SwiftGen/SwiftGen) with [Homebrew](https://brew.sh/).

```bash
$ brew install mono0926/license-plist/license-plist
$ brew install swiftgen
```

or 

```bash
$ make install
```

## 3. Generate

Generate [LicensePlist](https://github.com/mono0926/LicensePlist) file.

```bash
$ make license
```

Generate [SwiftGen](https://github.com/SwiftGen/SwiftGen) file.

```bash
$ make asset
```



<br>

# Test

Testing is performed using a library called [PlaygroundTester](https://github.com/Losiowaty/PlaygroundTester).

