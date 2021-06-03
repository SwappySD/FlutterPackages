# custom_switch_lib

custom_switch_lib Package

How to use ? 
```
            CustomSwitch(
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              value: isActiveValue,
              widht: 90,
              height: 40,
              circle_widht: 42,
              circle_height: 42,
              circle_radious: 42,
              enabled: isEnable,
              onChanged: (bool val) {
                setState(() {
                  if (val) {
                    status = "In-Active";
                    isEnable = !val;
                    isActiveValue = !val;
                  } else {
                    status = "Active";
                    isEnable = !val;
                    isActiveValue = !val;
                  }
                });
              },
            )
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
