# Firebase Setup Instructions

## Prerequisites
- Flutter installed
- Firebase account
- Firebase CLI installed (`npm install -g firebase-tools`)

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Enter project name: "BullyButton" (or your preferred name)
4. Follow the setup wizard
5. Enable Google Analytics (optional)

## Step 2: Add Flutter App to Firebase

### For iOS:
1. In Firebase Console, click "Add app" → iOS
2. Register your iOS app with bundle ID: `com.bullybutton.bullybutton`
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory

### For Android:
1. In Firebase Console, click "Add app" → Android
2. Register your Android app with package name: `com.bullybutton.bullybutton`
3. Download `google-services.json`
4. Place it in `android/app/` directory

## Step 3: Configure FlutterFire CLI

1. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. Configure Firebase for your Flutter project:
   ```bash
   flutterfire configure
   ```
   
   This will:
   - Detect your Firebase projects
   - Generate `lib/firebase_options.dart`
   - Configure platform-specific files

3. Update `lib/main.dart` to use the generated options:
   ```dart
   import 'firebase_options.dart';
   
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   ```

## Step 4: Enable Firebase Services

### Enable Anonymous Authentication:
1. Go to Firebase Console → Authentication
2. Click "Get started"
3. Enable "Anonymous" sign-in method
4. Save

### Enable Firestore:
1. Go to Firebase Console → Firestore Database
2. Click "Create database"
3. Start in **test mode** (we'll update rules)
4. Choose your region
5. Click "Enable"

## Step 5: Deploy Security Rules

1. Install Firebase CLI (if not already installed):
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Initialize Firebase in your project:
   ```bash
   firebase init firestore
   ```
   - Select your Firebase project
   - Use the existing `firestore.rules` file
   - Use the existing `firestore.indexes.json` file (or create empty one)

4. Deploy the rules:
   ```bash
   firebase deploy --only firestore:rules
   ```

## Step 6: Add Sample Data (Optional)

You can add sample positive messages using the Firebase Console or by running the app and submitting messages through the UI.

### Sample Positive Messages (via Firebase Console):
1. Go to Firestore Database
2. Create collection: `messages`
3. Add documents with these fields:
   - `message` (string): Your positive message
   - `author` (string): "Anonymous" or a name
   - `timestamp` (timestamp): Current date/time
   - `likes` (number): 0

### Example Messages:
- "You are stronger than you think. Keep going! 💪"
- "Kindness costs nothing but means everything. Spread love! ❤️"
- "Your voice matters. Never be afraid to speak up! 🗣️"
- "Every day is a fresh start. You've got this! 🌟"
- "You are not alone. There are people who care about you! 🤝"

## Troubleshooting

### Firebase not initialized:
- Make sure you've run `flutterfire configure`
- Check that `firebase_options.dart` exists in `lib/`
- Verify platform-specific config files are in place

### Authentication errors:
- Ensure Anonymous auth is enabled in Firebase Console
- Check that your bundle ID / package name matches Firebase project

### Firestore errors:
- Verify security rules are deployed
- Check that Firestore is enabled in Firebase Console
- Ensure you're using the correct collection names: `reports` and `messages`

## Next Steps

After setup:
1. Run `flutter pub get`
2. Run `flutter run` to test the app
3. Test the "Report Bullying" feature (creates anonymous user)
4. Test the "Positive Messages" feed
5. Verify data appears in Firestore Console

