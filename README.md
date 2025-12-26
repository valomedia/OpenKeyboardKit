# KeyboardKit

KeyboardKit lets you create amazing custom keyboard extensions with a few lines of code, using Swift & SwiftUI.
KeyboardKit extends Apple's limited keyboard APIs with more capabilities. It is a fork of the last open source version
of [KeyboardKit](https://keyboardkit.com).

## Installation

OpenKeyboardKit can be installed with the Swift Package Manager:

```
https://github.com/valomedia/OpenKeyboardKit.git
```

OpenKeyboardKit must then be linked to all targets that will use it.  

## Getting Started

The easiest way to set up KeyboardKit is to first create a `KeyboardApp` value for your app:

```swift
import KeyboardKit

extension KeyboardApp {

        static var keyboardKitDemo: KeyboardApp {
        .init(
            name: "KeyboardKit",
            licenseKey: "your-key-here",                // Needed for KeyboardKit Pro!
            appGroupId: "group.com.keyboardkit.demo",   // Sets up App Group data sync
            locales: .keyboardKitSupported,             // Sets up the enabled locales
            autocomplete: .init(                        // Sets up custom autocomplete  
                nextWordPredictionRequest: .claude(...) // Sets up AI-based prediction
            ),
            deepLinks: .init(app: "kkdemo://", ...)     // Defines how to open the app
        )
    }
}
```  

Next, let your `KeyboardController` inherit ``KeyboardInputViewController`` instead of `UIInputViewController`:

```swift
class KeyboardController: KeyboardInputViewController {}
```

This unlocks additional functions and capabilities, and adds `services` and observable `state` to the controller. 

Next, override `viewDidLoad()` and call `setup(for:)` to set up the keyboard extension for your app:

```swift
class KeyboardViewController: KeyboardInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the keyboard with the app we created above
        setup(for: .keyboardKitDemo) { result in
            // If `result` is `.success`, the setup did succeed.
            // This is where you can setup custom services, etc.
        }
    }
}
```

This will make keyboard settings sync data between the main app and its keyboard if the `KeyboardApp` defines an
`appGroupId`, set up KeyboardKit Pro if it defines a `licenseKey`, set up dictation and deep links, etc.

To replace or customize the standard `KeyboardView`, just override `viewWillSetupKeyboardView()` and let it call
`setupKeyboardView(_:)` with the view that you want to use:

```swift
class KeyboardViewController: KeyboardInputViewController {

    override func viewWillSetupKeyboardView() {
        setupKeyboardView { [weak self] controller in // <-- Use weak or unowned self!
            KeyboardView(
                state: controller.state,
                services: controller.services,
                buttonContent: { $0.view },
                buttonView: { $0.view },
                collapsedView: { $0.view },
                emojiKeyboard: { $0.view },
                toolbar: { $0.view }
            )
        }
    }
}
```

To set up your main app with the same keyboard configuration, wrap the content view in a `KeyboardAppView`:

```swift
@main
struct MyApp: App {

    var body: some Scene {
        WindowGroup {
        
            // Here we use the keyboard app we created above
            KeyboardAppView(for: .keyboardKitDemo) {
                ContentView()
            }
        }
    }
}
```

For more information, see the Getting Started Guide and Essentials articles.

## Localization

KeyboardKit supports 75 locales:

🇺🇸 🇦🇱 🇦🇪 🇦🇲 🇦🇿 🇧🇾 🇧🇩 🇧🇬 🇦🇩 🏳️ <br />
🏳️ 🇭🇷 🇨🇿 🇩🇰 🇳🇱 🇧🇪 🇦🇺 🇨🇦 🇬🇧 🇺🇸 <br />
🇪🇪 🇫🇴 🇵🇭 🇫🇮 🇫🇷 🇨🇦 🇧🇪 🇨🇭 🇬🇪 🇩🇪 <br />
🇦🇹 🇨🇭 🇬🇷 🇺🇸 🇮🇱 🇭🇺 🇮🇸 🏳️ 🇮🇩 🇮🇪 <br />
🇮🇹 🇰🇿 🇹🇯 🇹🇯 🇹🇯 🇱🇻 🇱🇹 🇲🇰 🇲🇾 🇲🇹 <br />
🇲🇳 🏳️ 🇳🇴 🇳🇴 🇮🇷 🇵🇱 🇵🇹 🇧🇷 🇷🇴 🇷🇺 <br />
🇷🇸 🇷🇸 🇹🇯 🇸🇰 🇸🇮 🇪🇸 🇦🇷 🇲🇽 🇸🇪 🇰🇪 <br />
🇹🇷 🇺🇦 🇺🇿 🇻🇳 🏴󠁧󠁢󠁷󠁬󠁳󠁿 <br />

KeyboardKit only includes localized strings, while KeyboardKit Pro unlocks localized keyboards, layouts,
callouts, and behaviors for all supported locales.

## Features

KeyboardKit provides a free, open-source keyboard engine. KeyboardKit Pro unlocks more powerful pro features.

* 🌱 Essentials - Essential models, services, utilities & views.
* ⌨️ Essentials-KeyboardView - A native-looking, customizable keyboard.
* 💥 Actions - Trigger & handle keyboard-related actions.
* 📱 App - Set up your app, keyboard, sync settings, etc.
* 🗯 Callouts - Show input & secondary action callouts.
* 🖥️ Device - Identify device type, capabilities, etc.
* 😀 Emojis - Emojis, categories, versions, skin tones, etc.
* 🔉 Feedback - Trigger audio & haptic feedback.
* 👆 Gestures - Handle a rich set of gestures on any key.
* 🔣 Layout - Define and customize dynamic keyboard layouts.
* 🌐 Localization - Additional locale-related utilities.
* 🗺️ Navigation - Open urls and other apps from the keyboard.
* 👁 Previews - Extensive SwiftUI preview support.
* 📄 Proxy - Extend the text document proxy with more capabilities.
* ⚙️ Settings - Provide keyboard settings & link to System Settings.
* 🩺 Status - Detect if a keyboard is enabled, has full access, etc.
* 🎨 Styling - Style your keyboard to a great extent.

## Documentation

The documentation has a thorough getting-started guide, a detailed article for each feature, code samples, etc. You can
build it by selecting Product → Build Documentation in XCode or using the `docbuild` action of `xcodebuild(1)`.

## Demo App

The `Demo` folder has a demo app that shows how to set up the main keyboard app, show keyboard status, provide in-app
settings, link to system settings, apply custom styles, etc. 

The app has two keyboards - a `Keyboard` that uses KeyboardKit and a `KeyboardPro` that uses KeyboardKit Pro.

> [!IMPORTANT]
> The demo isn't code signed and can therefore not use an App Group to sync settings between the app and its keyboards.
> As such, the `KeyboardPro` keyboard has keyboard settings in the keyboard as well.

## Support This Project

OpenKeyboardKit is open-source and completely free. We don't want your money, but pull requests are always welcome.
There is no support and no guarantee that the software works as intended. If you find a bug, you can file an issue, but
we can't promise that it'll be fixed in a timely manner (or at all).

The upstream project [KeyboardKit](https://keyboardkit.com) is still under active development, albeit as a 
closed-source project with a proprietary license. If you need a more professional offering, it will be a much better
fit for your needs – especially if you have some money to spare.

## License

KeyboardKit is available under the MIT license. See the LICENSE file for more info.

