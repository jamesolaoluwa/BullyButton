# Sample Data for BullyButton

## Positive Messages Collection

### Message 1
```json
{
  "message": "You are stronger than you think. Keep going! 💪",
  "author": "Anonymous",
  "timestamp": "2024-01-15T10:00:00Z",
  "likes": 0
}
```

### Message 2
```json
{
  "message": "Kindness costs nothing but means everything. Spread love! ❤️",
  "author": "Anonymous",
  "timestamp": "2024-01-15T11:00:00Z",
  "likes": 0
}
```

### Message 3
```json
{
  "message": "Your voice matters. Never be afraid to speak up! 🗣️",
  "author": "Anonymous",
  "timestamp": "2024-01-15T12:00:00Z",
  "likes": 0
}
```

### Message 4
```json
{
  "message": "Every day is a fresh start. You've got this! 🌟",
  "author": "Anonymous",
  "timestamp": "2024-01-15T13:00:00Z",
  "likes": 0
}
```

### Message 5
```json
{
  "message": "You are not alone. There are people who care about you! 🤝",
  "author": "Anonymous",
  "timestamp": "2024-01-15T14:00:00Z",
  "likes": 0
}
```

### Message 6
```json
{
  "message": "It's okay to ask for help. That's a sign of strength, not weakness. 💙",
  "author": "Anonymous",
  "timestamp": "2024-01-15T15:00:00Z",
  "likes": 0
}
```

### Message 7
```json
{
  "message": "You deserve to be treated with respect and kindness. Always. ✨",
  "author": "Anonymous",
  "timestamp": "2024-01-15T16:00:00Z",
  "likes": 0
}
```

### Message 8
```json
{
  "message": "Small acts of kindness can create big ripples of change. 🌊",
  "author": "Anonymous",
  "timestamp": "2024-01-15T17:00:00Z",
  "likes": 0
}
```

### Message 9
```json
{
  "message": "Your feelings are valid. Don't let anyone tell you otherwise. 💜",
  "author": "Anonymous",
  "timestamp": "2024-01-15T18:00:00Z",
  "likes": 0
}
```

### Message 10
```json
{
  "message": "Standing up for others is one of the bravest things you can do. 🛡️",
  "author": "Anonymous",
  "timestamp": "2024-01-15T19:00:00Z",
  "likes": 0
}
```

### Message 11
```json
{
  "message": "You are worthy of happiness and peace. Don't forget that. 🌈",
  "author": "Anonymous",
  "timestamp": "2024-01-15T20:00:00Z",
  "likes": 0
}
```

### Message 12
```json
{
  "message": "Together we can create a world where everyone feels safe. 🌍",
  "author": "Anonymous",
  "timestamp": "2024-01-15T21:00:00Z",
  "likes": 0
}
```

### Message 13
```json
{
  "message": "It's okay to not be okay. Take your time, be gentle with yourself. 🦋",
  "author": "Anonymous",
  "timestamp": "2024-01-15T22:00:00Z",
  "likes": 0
}
```

### Message 14
```json
{
  "message": "You have the power to make a difference. Start with kindness. 💫",
  "author": "Anonymous",
  "timestamp": "2024-01-15T23:00:00Z",
  "likes": 0
}
```

### Message 15
```json
{
  "message": "Remember: what someone says or does says more about them than you. 🎯",
  "author": "Anonymous",
  "timestamp": "2024-01-16T10:00:00Z",
  "likes": 0
}
```

### Message 16
```json
{
  "message": "You are enough, just as you are. Believe it. 💎",
  "author": "Anonymous",
  "timestamp": "2024-01-16T11:00:00Z",
  "likes": 0
}
```

### Message 17
```json
{
  "message": "Courage is not the absence of fear, but action despite it. 🦁",
  "author": "Anonymous",
  "timestamp": "2024-01-16T12:00:00Z",
  "likes": 0
}
```

### Message 18
```json
{
  "message": "Your mental health matters. Take care of yourself first. 🧠",
  "author": "Anonymous",
  "timestamp": "2024-01-16T13:00:00Z",
  "likes": 0
}
```

### Message 19
```json
{
  "message": "Empathy is a superpower. Use it to lift others up. 🚀",
  "author": "Anonymous",
  "timestamp": "2024-01-16T14:00:00Z",
  "likes": 0
}
```

### Message 20
```json
{
  "message": "You are creating a better world by being yourself. Keep shining! ☀️",
  "author": "Anonymous",
  "timestamp": "2024-01-16T15:00:00Z",
  "likes": 0
}
```

## How to Add Sample Data

### Option 1: Via Firebase Console
1. Go to Firestore Database in Firebase Console
2. Click "Start collection"
3. Collection ID: `messages`
4. Add each message as a document with the fields above
5. For timestamp, use the "timestamp" type and select current date/time

### Option 2: Via Code (Temporary Script)
You can create a temporary Dart script to seed the data:

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  final messages = [
    {
      'message': 'You are stronger than you think. Keep going! 💪',
      'author': 'Anonymous',
      'timestamp': Timestamp.now(),
      'likes': 0,
    },
    // ... add other messages
  ];
  
  final firestore = FirebaseFirestore.instance;
  for (var msg in messages) {
    await firestore.collection('messages').add(msg);
  }
  
  print('Sample data added!');
}
```

## Support Resources

The support resources are hardcoded in the app (see `lib/screens/support_resources_screen.dart`), but include:

1. **What to do if you're being bullied** 🛟
   - Steps to protect yourself
   - How to get help
   - Links to resources

2. **How to support someone else** 💛
   - Being an upstander
   - Showing kindness
   - Reporting bullying

3. **Understanding bullying** 🧠
   - Types of bullying
   - Effects of bullying
   - Educational resources

4. **Getting help and support** 🤝
   - Crisis contacts
   - Hotlines
   - School resources

These are already included in the app and don't need to be added to Firestore.

