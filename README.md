# torchx
[![Pub Version](https://img.shields.io/pub/v/torchx?color=blue)](https://pub.dev/packages/torchx)
<br/>

## TorchX flutter library
`#torch #flash #flashlight #lantern #torchlight`
<br/>

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 🚧 Version
|             | Android | iOS     |
|-------------|---------|---------|
| **Support** | SDK 23+🔼 <br> LolliPop🍭 | iOS 10+🔼 |



<br/>

## 🌱 Torch level(strength) measure tip
|      os     |   type    |    min   |   max  |
|-------------|-----------|----------|--------|
| **Android** | `integer` |    `1`   |   `5`  |
|   **iOS**   | `float`   |   `0.1`  |  `1.0` |

<br/>

## 🚀 Usage

#### Flash ON 🌝
```dart
Torch.instance.flashOn();
```
Measure torch level and flashOn 🌝
```dart
double torchLevel = 0.5;

Torch.instance.flashOnLevel(strengthLevel: level);
```
#### Flash OFF 🌚
```dart
Torch.instance.flashOff();
```
#### Flash On/Off state 🌝/🌚
```dart
await Torch.instance.isTorched;
```
#### set/get torch strength level 🌞
```dart
double torchLevel = 0.5;

// set
Torch.instance.setLevel(strengthLevel: torchLevel);

// get
torchLevel = await Torch.instance.getLevel();
```
<br/>
<br/>

