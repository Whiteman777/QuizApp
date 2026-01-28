# Flutter Quiz App

A clean, well-architected Flutter quiz application demonstrating state management patterns, component composition, and Material Design principles.

## Download

### 📱 Try the App

**[Download Flutter Quiz v1.0.0 (APK)](https://drive.google.com/file/d/1ycCw5I4NMCMnwhLJJTkton4AmF8RZ8Nl/view?usp=sharing)**

**Requirements:**
- Android 5.0 (Lollipop) or higher
- ~43 MB download size

**Installation:**
1. Download the APK from the link above
2. On your Android device, go to **Settings → Security**
3. Enable **"Install from unknown sources"** (or "Install unknown apps" on newer Android versions)
4. Open the downloaded APK file and tap **Install**
5. Launch the app and start the quiz!

---

## Overview

This Flutter application implements a multiple-choice quiz with automatic scoring and detailed results. The app showcases Flutter fundamentals including stateful widgets, callback patterns, and efficient state management using the "lifted state" pattern.

## Screenshots

*Coming soon*

## Features

- **6 Flutter-focused questions** covering framework concepts
- **Shuffled answer options** for replayability
- **Automatic scoring** with instant feedback
- **Detailed results screen** showing correct vs. selected answers
- **Clean Material Design UI** with gradient backgrounds
- **Restart functionality** to retake the quiz

## Architecture

### State Management Pattern

The app uses the **lifted state pattern** where a parent component (`Quiz`) owns all application state and passes down callbacks to child components:

```
Quiz (Stateful) - State Owner
├── selectedAnswers: List<String>
├── correct: int
├── activeScreen: String
│
├── StartScreen (Stateless)
├── QuestionsScreen (Stateful)
└── ResultScreen (Stateless)
    └── QuestionsSummary (Stateless)
```

**Key State Variables:**
- `selectedAnswers` - Tracks all user responses
- `correct` - Maintains score count
- `activeScreen` - Controls screen navigation ('start', 'questions', 'result')

**Communication Flow:**
- Child components receive state as props
- Child components receive callback functions to modify parent state
- Parent re-renders when state changes, cascading updates to children

### Why Lifted State?

This pattern provides:
- **Single source of truth** - State lives in one place
- **Predictable data flow** - Always top-down
- **Easy debugging** - State changes happen in one component
- **Component reusability** - Children remain stateless when possible

## Technical Implementation

### Automatic Progress Tracking

The app uses `selectedAnswers.length` as a single source of truth for progress:

```dart
void chooseAnswer(String answer) {
  setState(() {
    selectedAnswers.add(answer);
    
    // Auto-navigate when all questions answered
    if (selectedAnswers.length == questions.length) {
      // Calculate score
      correct = 0;
      for (final entry in questions.asMap().entries) {
        if (entry.value.answers[0] == selectedAnswers[entry.key]) {
          correct++;
        }
      }
      activeScreen = 'result';
    }
  });
}
```

**Algorithm Complexity:** O(n) where n is the number of questions

### Answer Randomization

Each question shuffles its options independently:

```dart
class QuizQuestion {
  final String text;
  final List<String> answers;
  
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
```

The first element (`answers[0]`) always contains the correct answer in the data model, but `getShuffledAnswers()` returns a randomized copy for display.

### Restart Mechanism

```dart
void restartQuiz() {
  setState(() {
    selectedAnswers = [];
    correct = 0;
    activeScreen = 'start';
  });
}
```

Clears all state and returns to the start screen while maintaining the widget tree.

## Getting Started

### Prerequisites

- Flutter SDK (3.0+)
- Dart SDK (3.0+)
- Android Studio / VS Code with Flutter extensions

### Installation

```bash
# Clone the repository
git clone https://github.com/Whiteman777/QuizApp.git
cd QuizApp

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Build APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^8.0.0      # Custom typography
  cupertino_icons: ^1.0.8   # iOS-style icons

dev_dependencies:
  flutter_lints: ^5.0.0               # Code quality rules
  flutter_launcher_icons: ^0.13.1    # Icon generation
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── quiz.dart                 # Main state container (Stateful)
├── start_screen.dart         # Welcome screen (Stateless)
├── questions_screen.dart     # Quiz interface (Stateful)
├── result_screen.dart        # Results display (Stateless)
├── questions_summary.dart    # Answer breakdown (Stateless)
├── answer_button.dart        # Reusable button component
├── theme.dart                # Gradient background definition
├── models/
│   └── quiz_questions.dart   # Question data model
└── data/
    └── questions.dart        # Quiz question data
```

## Extending the App

### Adding New Questions

Edit `lib/data/questions.dart`:

```dart
const questions = [
  QuizQuestion(
    'Your question here?',
    [
      'Correct answer (must be first)',
      'Wrong answer 2',
      'Wrong answer 3',
      'Wrong answer 4',
    ],
  ),
  // Add more questions...
];
```

**Important:** The correct answer must always be the first element in the list. The app automatically shuffles options during display.

### Customizing Theme

Modify `lib/theme.dart` to change the gradient background:

```dart
var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;
```

## Application Flow

```
[Start Screen] 
     ↓ (Press "Start Quiz")
[Questions Screen]
     ↓ (Answer all 6 questions)
[Result Screen]
     ↓ (Press "Restart Quiz")
[Start Screen]
```

The app uses string-based screen management (`'start'`, `'questions'`, `'result'`) rather than Flutter's navigation stack, keeping all state in memory throughout the session.

## License

This project is open source and available for educational purposes.

---