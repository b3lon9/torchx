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

## version
Android 23 (LolliPop) =< 🔼 <br />
IOS 10 <= 🔼 <br/>

<br/>

## add
```shell
flutter pub add torchx
```
<br/>

## import
```dart
import 'package:torchx/torchx.dart'
```
<br/>

## usage

#### Flash ON
```dart
Torch.instance.flashOn();
```
measure torch level and flashOn
```dart
double torchLevel = 0.5;

Torch.instance.flashOnLevel(strengthLevel: level);
```
#### Flash OFF
```dart
Torch.instance.flashOff();
```
#### Flash On/Off state
```dart
await Torch.instance.isTorched;
```
#### set/get torch strength level
```dart
double torchLevel = 0.5;

// set
Torch.instance.setLevel(strengthLevel: torchLevel);

// get
torchLevel = await Torch.instance.getLevel();
```
<br/>
<br/>

## LICENSE
```text
MIT License

Copyright (c) 2024 neander of donguran

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
