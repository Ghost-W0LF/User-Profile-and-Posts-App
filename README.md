<<<<<<< HEAD
# User-Profile-and-Posts-App
A simple Flutter application that allows users to view and edit their profile, as well as view a list of posts fetched.
=======
# recruitment_assignment
A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
>>>>>>> 3b5246d (Profile page with Post page feached with api)
## Features

- View and edit user profile (name, email, profile picture).
- Persist user data using `SharedPreferences`.
- Fetch and display a list of posts from an API.
- Navigation between Profile and Posts pages.

## Installation

### Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) with Flutter and Dart plugins.

### Clone the Repository

```bash
git clone https://github.com/your-username/flutter-user-profile-posts.git
cd flutter-user-profile-posts

iOS Configuration (if running on iOS)
Add the following keys to your Info.plist file located in ios/Runner/Info.plist:
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs access to your photo library to upload profile pictures.</string>
<key>NSCameraUsageDescription</key>
<string>This app needs access to your camera to take profile pictures.</string>

Dependencies

provider: ^6.0.0 (for state management)
shared_preferences: ^2.0.13 (for persisting data)
image_picker: ^0.8.5+3 (for picking images from the gallery or camera)
http: ^1.2.2
device_preview: ^1.2.0(for previewing in different device)
