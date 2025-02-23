# SwiftProgressKit

SwiftProgressKit is a customizable and lightweight progress bar library built using SwiftUI. It provides multiple progress bar styles, including linear, circular, and semi-circular progress indicators, to enhance your iOS applications.

# Features 🚀

📏 Customizable Progress Bars (Linear, Circular, Semi-Circular)

🎨 Dynamic Styling (Custom Colors, Gradients, and Thickness)

🎯 Smooth Animations

⚡ Lightweight and Fast Performance

📱 SwiftUI-Compatible

# Installation 📥

Currently, SwiftProgressKit is not available as an SPM package. You can manually integrate it into your project by following these steps:

Clone this repository:

git clone https://github.com/ParulVerma12/SwiftProgressKit.git

Copy the Sources folder into your Xcode project.

# Usage 🛠️

1. Linear Progress Bar

```swift
import SwiftProgressKit

struct ContentView: View {
    var body: some View {
        LinearProgressBar(progress: 0.7)
            .frame(height: 10)
            .padding()
    }
}
```

2. Circular Progress Bar

```swift
import SwiftProgressKit

struct ContentView: View {
    var body: some View {
        CircularProgressBar(progress: 0.5, lineWidth: 8, gradient: Gradient(colors: [.blue, .purple]))
            .frame(width: 100, height: 100)
    }
}
```

3. Semi-Circular Progress Bar

```swift
import SwiftProgressKit

struct ContentView: View {
    var body: some View {
        SemiCircularProgressBar(progress: 0.8)
            .frame(width: 150, height: 75)
    }
}
```

# Customization 🎨

You can customize the progress bars by modifying:

Progress Value (0.0 - 1.0)

Bar Color & Gradients

Thickness & Shape

Animation Speed


# Connect with Me 🌍

Developer: Parul Verma

Let's build something amazing together! 🚀
