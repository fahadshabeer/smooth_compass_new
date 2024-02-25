# Smooth Compass New
 An Updated version of Smooth Compass
[comment]: <> ([![Awesome Flutter]&#40;https://img.shields.io/badge/Awesome-Flutter-52bdeb.svg?longCache=true&style=flat-square&#41;]&#40;https://github.com/Solido/awesome-flutter&#41;)

Customizable flutter package to find direction using device motion sensors.

| ![Image](https://github.com/alihadi5125/screenshots/blob/main/ezgif.com-gif-maker%20(3).gif?raw=true) | ![Image](https://github.com/alihadi5125/screenshots/blob/main/ezgif.com-gif-maker%20(1).gif?raw=true) |
| :------------: | :------------: |
| **SmoothCompass** with default Widget | **SmoothCompass** with custom Widget |

## Features

* Extensive, yet easy to use
* Preconfigured UI and custom UI support
* Custom builder
* Smooth Rotation
* Values in degrees
* (NEW) Qiblah angle


### Installation

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  smooth_compass: ^1.0.0
```

## Examples

Make sure to check out [examples](https://github.com/fahadshabeer/smooth_compass_examples.git)

## Video Tutorials

* [Simple compass](https://youtu.be/nMEjn1a-6Xs)
* [Simple compass with direction values](https://youtu.be/35RbaQP8l3s)
* [Qiblah compass](https://youtu.be/sH7oCWjKvD4)


### iOS
Make sure to add keys with appropriate descriptions to the `Info.plist` file.

* `NSLocationWhenInUseUsageDescription`
* `NSLocationAlwaysAndWhenInUseUsageDescription`


### Android
Make sure to add permissions to the `app/src/main/AndroidManifest.xml` file.

* `android.permission.INTERNET`
* `android.permission.ACCESS_COARSE_LOCATION`
* `android.permission.ACCESS_FINE_LOCATION`

### Basic setup

*The complete example is available [here](https://github.com/alihadi5125/smooth_compass/tree/master/example).*

**SmoothCompass** provide `compassBuilder` which returns:
* `degrees` is the directional value.
* `turns` is the value for compass rotation.
* `compassAsset` the (default) widget for compass or the Widget passed in compassAsset
* `qiblahOffset` returns the qiblah angle for the current location

**SmoothCompass** Optional Arguments `Height`, `Width`, `Duration`, `isQiblahCompass` and `compassAsset`:
* `compassAsset` is the customizable widget for compass. if not provider default will shown.
* `isQiblahCompass` must be provided, if you want to find the qiblah angle for current location, the default qiblah value will be 0.

**Default Widget**:
```dart
  SmoothCompass(
   //higher the value of rotation speed slower the rotation
    rotationSpeed: 200,
    height: 300,
    width: 300,
)
```




**Custom Widget**:
```dart
SmoothCompass(
  rotationSpeed: 200,
  height: 300,
  width: 300,
  compassAsset: CustomWidget(),
)
```

**Customize Error Button and Permissions message**:
```dart
SmoothCompass(
  height: 300,
  width: 300,
  isQiblahCompass: true,
  
  //need to customize if isQiblahCompass set to true
  //customize error message and error button style here
  errorDecoration: ErrorDecoration(
    spaceBetween: 20,
    permissionMessage: PermissionMessage(
    denied: "location permission is denied",
    permanentlyDenied: "location permission is permanently denied",
  ),
  buttonStyle: ErrorButtonStyle(
    borderRadius: BorderRadius.circular(10),
    buttonColor: Colors.red,
    textColor: Colors.white,
    buttonHeight: 40,
    buttonWidth: 150
  ),
  messageTextStyle: const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    fontSize: 18
  )
  ),
)
```

**Custom Widget with qiblah**:
```dart
SmoothCompass(
  height: 200,
  width: 200,
  isQiblahCompass: true,
  compassBuilder: (context,snapshot,child){
    return  AnimatedRotation(
      duration: const Duration(milliseconds:800),
      turns: snapshot?.data?.turns??0,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child:Image.asset("assets/images/compass.png",fit: BoxFit.fill,),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child:AnimatedRotation(
              duration: const Duration(milliseconds: 500),
              turns: (snapshot?.data?.qiblahOffset??0)/360,
              //Place your qiblah needle here
              child: Container(
                decoration: const BoxDecoration(
                shape: BoxShape.circle,),
                child: const VerticalDivider(
                  color: Colors.grey,
                  thickness: 5,),
              )
            ),
          ),
        ],
      ),
    );
  },
)
```




#### Support

for any queries or issue contact at:
* fadiktk000@gmail.com

