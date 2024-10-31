## Ulearna Test
A Flutter application following the Clean Architecture pattern, designed with modularized features and implementing Bloc for state management. The app consists of two main features: Intro and Reel, leveraging dependency injection, API integration, and a cohesive theme setup.

## Features
1. Intro Feature
Splash Screen: A welcoming splash screen displayed on app startup, guiding the user into the app.
2. Reel Feature
Home Screen: Displays reels in a format similar to social media platforms, showing:
Video Playback: Smooth video playback using the Chewie package.
Reel Details: Includes the number of likes, comments, and shares on each reel.
API Integration: Fetches data through HTTP requests, utilizing dependency injection for service management.

## Project Structure
The project is organized using Flutter Clean Architecture, separating responsibilities across different layers and maintaining modularity for scalability and testing.

## Project Files Layers 
Core Layer:

Houses shared resources, functions, and widgets utilized across the app, including:
Shared Widgets: Reusable UI components.
Themes: App-wide theme and styling configurations.
Resources: Asset management (images, fonts, etc.).
Utilities: Shared functions and helpers.
Router Layer:

Defines app-wide routing using a centralized router file for easy navigation management.

App Layer:

Separates the main function from the MaterialApp widget.
Initializes dependencies and injects core services at the app's root level.
State Management
The project uses Bloc as its state management solution, providing a reactive approach to handle app states and efficiently manage UI updates.
Dependency Injection
Get It is used to manage dependencies, enabling easy injection of services and repositories throughout the app, such as HTTP clients for API requests.

## Prerequisites
Flutter SDK: Ensure you have the latest version of Flutter installed on your machine.

Packages: Install the necessary packages by running:

bash
Copy code
flutter pub get
Running the App

## Clone the repository:

bash
Copy code
git clone <repository-url>
cd <project-directory>
Install the dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run

## Project Setup
HTTP Package: The project uses the http package to manage API calls, with requests and responses handled in the data layer.
Chewie Package: For video caching and playback in the Reel feature, Chewie is integrated, providing a seamless viewing experience.
Dependency Injection: Configured with Get It, making services accessible throughout the app.
State Management: Bloc pattern is implemented for maintaining clean and testable state logic
etc..