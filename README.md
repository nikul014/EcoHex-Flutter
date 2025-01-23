# EcoHex Flutter App

EcoHex is a mobile app designed to educate users about environmental sustainability and motivate them to adopt eco-friendly habits through gamified weekly tasks. Each week, users receive new tasks focused on different environmental impacts and earn points by completing various steps for each task. Users can engage with these tasks, learn more about eco-friendly practices, and earn rewards to track their progress.

![App Screenshot 1](/App%20Preview%20Shots/EcoChallengeApp.png)

<a href="https://vimeo.com/1049777786/53016acc1d" target="_blank">
  <img src="/App%20Preview%20Shots/video_button.png" alt="Watch the video" style="width: 100px; height: auto;">
</a>


## Architecture & Technologies

This app is developed using Flutter to provide a smooth cross-platform experience. The backend of the app will utilize Firebase for data storage, user authentication, and points management. Firebase Cloud Functions are used to handle periodic tasks like refreshing weekly challenges and managing quizzes.

### Tech Stack:
- **Frontend**: Flutter
- **Backend**: Firebase (Firestore, Firebase Authentication, Cloud Functions)
- **State Management**: Provider or Riverpod
- **UI/UX**: Material Design Components

## Features in Detail

### 1. **Task Flow**
- Each task consists of multiple steps.
- Users can tap "Next" to move to the next step.
- Once all steps are completed, users are rewarded with points or rewards.

### 2. **Rewards System**
- Points are earned for completing tasks, which are tracked and displayed on the user’s profile.
- Additional rewards may be earned by completing quizzes (if implemented).

### 3. **Quizzes**
- After completing each task, users may be prompted with a quiz to test their knowledge.
- Correct answers can earn users additional points.

### 4. **New Task Every Week**
- The app will automatically generate a new task each week, replacing the previous task, to keep users engaged with fresh content.

### 5. **Notifications**
- Users receive a weekly notification when a new task is available, ensuring they stay engaged.

## Key Features

- **Weekly Tasks**: Every week, users receive a new task that helps them learn more about eco-friendly habits and their environmental impact.

- **Gamification**: Tasks consist of different steps that users can complete by tapping "Next." Upon completing all steps, users are rewarded with points or other incentives.

- **Task Progression**: As each week progresses, new tasks replace old ones, ensuring fresh content and continued engagement.

- **Quizzes**: Each task may include a quiz to assess the user's understanding, and they can earn additional rewards for correct answers.

## Example Weekly Tasks

Here are a few examples of tasks users will engage with during the first month:

1. **Week 1**: Learn which clothing materials are more eco-friendly and sustainable.
2. **Week 2**: Understand how cleaning products affect the water supply and discover safer alternatives.
3. **Week 3**: Explore the environmental benefits of dining in or walking in instead of ordering takeout.
4. **Week 4**: Discover the advantages of using public transportation or walking over driving.

## Installation

### Prerequisites
Ensure you have the following installed:
- Flutter SDK
- Dart
- Android Studio (or any other Flutter-compatible IDE)
- Firebase Account (for Firebase setup)

### Setup Instructions
1. Clone this repository.
2. Run `flutter pub get` to fetch dependencies.
3. Configure Firebase by adding your Firebase project credentials to the app.
4. Run the app using `flutter run`.


## App Preview Shots

![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_1.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_2.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_3.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_4.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_5.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_6.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_7.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_8.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_9.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_10.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_11.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_12.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_13.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_14.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_15.png)
![App Screenshot 1](/App%20Preview%20Shots/EcoChallenge_16.png)

## Contributing

Contributions are welcome! If you would like to help with the development of this app, feel free to fork this repository and submit a pull request. Please follow the guidelines and ensure all contributions are properly documented.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

