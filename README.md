# flutter_state_restoration

Flutter state restoration example app

## About

This is an example app of how to implement state restoration on Flutter.

### What is state restoration?

Operating systems like Android and iOS can kill the app's process when running low on resources like RAM.
The instance state can be preserved and restored using State Restoration APIs like `RestorationMixin` and `restorablePush()`, for example.

For more information about, visit [documentation](https://flutter.dev/go/state-restoration-design).

## How to test

1. Enable "Don't keep activities" option in the developer menu on Android settings.
  ![Enable "Don't keep activities" on developer options](/docs/dont_keep_activities.png)
2. Open the example app
3. Tap on "With state restoration" button
4. Play around with input field, checkbox, list scroll, etc...
5. Go to device home screen or another app via launcher (or recent apps)
6. Switch back to the example app
7. You should see everything as it was before minimizing the app

## TODO

- [X] Primitive properties
- [X] Text Field
- [X] Navigation
  - [X] Passing arguments
  - [X] Receiving result
- [X] List (Scroll position)
- [ ] Scaffold (Drawer)
- [ ] Dialog
- [ ] Bottom Navigation
- [ ] Comparison with native implementations (Activity's onRestoreInstanceState/ViewModel's Saved State)

Note: Currently, there is no state restoration support for Bottom Sheets (See [issue #70915](https://github.com/flutter/flutter/issues/70915))