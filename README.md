# PadOSDC

DarkMode

|![padosdc_phone_1](https://user-images.githubusercontent.com/24838521/184555545-160d93de-aaf5-4cdc-ae51-02071a0cba8a.png)|![padosdc_phone_2](https://user-images.githubusercontent.com/24838521/184555547-75fa3a84-b040-4aa2-bee3-2155caa5d1ff.png)|![padosdc_phone_3](https://user-images.githubusercontent.com/24838521/184555548-bd6a0121-522f-4747-9157-5acf1b9f418a.png)|![padosdc_phone_4](https://user-images.githubusercontent.com/24838521/184555549-af3c82b4-9de1-46f1-9174-7cc5274173c2.png)|![padosdc_phone_7](https://user-images.githubusercontent.com/24838521/184555557-bafa23ec-fdeb-42d9-96ac-0d6fcbf94ede.png)|
|:---:|:---:|:---:|:---:|:---:|


LightMode

| <img src="https://user-images.githubusercontent.com/24838521/189039060-c4ea3440-ff94-4084-a564-0042af533ad1.png" width=200> | <img src="https://user-images.githubusercontent.com/24838521/189039106-35d0b9ba-b776-4e8d-8523-fc365214abff.png" width=200> | <img src="https://user-images.githubusercontent.com/24838521/189039112-375db71b-2275-4cce-83b9-5b295ba93740.png" width=200> | <img src="https://user-images.githubusercontent.com/24838521/189039119-16cf9615-8605-4840-83b5-6ff80eeb8c4d.png" width=200> | <img src="https://user-images.githubusercontent.com/24838521/189039351-77be0e1d-94de-47a6-a836-573fefb1e233.png" width=200> |
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

