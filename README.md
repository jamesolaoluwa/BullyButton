# BullyButton - Anti-Bullying Flutter App

A beautiful, modern Flutter mobile app with glassmorphism UI that promotes anti-bullying awareness and prevention. Built with Firebase backend, featuring anonymous reporting, positive messages feed, and comprehensive support resources.

## ✨ Features

- 🏠 **Welcome Screen** - Warm, encouraging intro with glassmorphism hero card
- 📝 **Anonymous Reporting** - Safe, anonymous bullying report submission
- 💝 **Positive Messages Feed** - Uplifting quotes and messages from the community
- 🛟 **Support Resources** - Comprehensive guides and crisis contacts
- 🎨 **Glassmorphism UI** - Modern, polished design with frosted glass effects
- ✨ **Smooth Animations** - Beautiful transitions and micro-interactions
- 🔐 **Firebase Integration** - Secure backend with anonymous authentication

## 🎨 Design

The app features a beautiful glassmorphism design with:
- Soft gradients (lavender, peach, sky blue, mint)
- Frosted blur background cards
- Translucent surfaces with glow shadows
- Modern rounded corners
- High contrast text for accessibility

## 📋 Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK (3.9.2 or higher)
- Firebase account
- iOS: Xcode (for iOS development)
- Android: Android Studio (for Android development)

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd BullyButtonV2
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Firebase Setup

Follow the detailed instructions in [`firebase_setup.md`](firebase_setup.md) to:

1. Create a Firebase project
2. Add iOS and Android apps
3. Configure FlutterFire CLI
4. Enable Anonymous Authentication
5. Enable Firestore Database
6. Deploy security rules

**Quick Setup:**
```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase
flutterfire configure
```

### 4. Run the App

```bash
# For iOS/Mac
flutter run -d ios

#For Chrome
flutter run -d chrome

# For Android
flutter run -d android
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/                  # Screen widgets
│   ├── home_screen.dart
│   ├── report_screen.dart
│   ├── positive_messages_screen.dart
│   └── support_resources_screen.dart
├── widgets/                  # Reusable widgets
│   ├── glass_button.dart
│   ├── glass_card.dart
│   ├── expandable_resource_tile.dart
│   └── confetti_success.dart
├── services/                 # Business logic
│   └── firebase_service.dart
├── models/                   # Data models
│   ├── bullying_report.dart
│   ├── positive_message.dart
│   └── support_resource.dart
├── theme/                    # Design system
│   ├── app_colors.dart
│   ├── app_text_styles.dart
│   └── app_shadows.dart
└── utils/                    # Utilities
    └── glass_effect.dart
```

## 🔧 Configuration

### Firebase Configuration

After running `flutterfire configure`, the app will automatically use the generated `firebase_options.dart` file. Make sure to:

1. Enable Anonymous Authentication in Firebase Console
2. Enable Firestore Database
3. Deploy the security rules from `firestore.rules`

### Security Rules

The app includes Firestore security rules that:
- Allow anonymous users to create reports
- Allow authenticated users to read/write messages
- Protect user data with proper validation

Deploy rules:
```bash
firebase deploy --only firestore:rules
```

## 📊 Sample Data

See [`sample_data.md`](sample_data.md) for sample positive messages to add to your Firestore database.

## 🎯 Key Features Explained

### Anonymous Reporting
- Users can submit bullying reports without revealing their identity
- Reports are stored securely in Firestore
- Form validation ensures data quality
- Success animation with confetti effect

### Positive Messages Feed
- Real-time stream of uplifting messages
- Users can like messages
- Ability to submit new positive messages
- Chronologically ordered feed

### Support Resources
- Expandable sections with detailed information
- Crisis contact information
- Links to official resources
- Educational content about bullying

## 🛠️ Technologies Used

- **Flutter** - UI framework
- **Riverpod** - State management
- **Firebase** - Backend (Auth, Firestore)
- **Google Fonts** - Typography (Poppins, Inter, Nunito)
- **Animations** - Smooth transitions
- **Confetti** - Success animations

## 📱 Platform Support

- ✅ iOS and MacOS
- ✅ Android
- ✅ Web

## 🐛 Troubleshooting

### Firebase not initialized
- Ensure you've run `flutterfire configure`
- Check that `firebase_options.dart` exists
- Verify platform-specific config files are in place

### Build errors
```bash
flutter clean
flutter pub get
flutter run
```

### Authentication errors
- Verify Anonymous auth is enabled in Firebase Console
- Check bundle ID / package name matches Firebase project

## 📝 License

This project is created for educational and anti-bullying awareness purposes.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Support

For issues or questions, please open an issue on GitHub.

## 🙏 Acknowledgments

Built with care to promote anti-bullying awareness and create a safe, supportive community.

---

**Remember**: Speak Up. Stand Strong. Support Each Other. 💙
