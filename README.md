# workout-tracker
A full-stack Workout Tracker application built with:

Flutter (Frontend)
Node.js + Express (Backend)
MySQL (XAMPP) (Database)
This project helps users track workouts, workout history, and streaks.

workout-tracker/
│
├── backend/
│   ├── src/
│   ├── database/
│   │   └── workouts.sql
│   ├── .env
│   └── package.json
│
├── flutter_app/
│   ├── lib/
│   └── pubspec.yaml
│
└── README.md

🛠 Prerequisites

Make sure you have the following installed:

XAMPP (for MySQL)
Node.js (v18+ recommended)
Flutter SDK
Android Studio / VS Code
Git

Database Setup (XAMPP + MySQL)
1️) Install XAMPP

Download and install XAMPP from:
2) https://www.apachefriends.org/

Start the following services from XAMPP Control Panel:
 Apache
 MySQL

Create Database

Open phpMyAdmin
 http://localhost/phpmyadmin
Create a new database:
CREATE DATABASE workout_db;

Import SQL File

Select the workout_tracker database

Click Import
Choose the SQL file from:
backend/database/workouts.sql
Click Go
-> Tables and data will be created automatically.

Backend Setup (Node.js)
1️-> Navigate to Backend Folder
cd backend

2️-> Install Dependencies
npm install

3️-> Configure Environment Variables

Create a .env file in the backend folder:

PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=workout_tracker


Default XAMPP MySQL username is root with no password.

-> Start Backend Server
npm run dev


If successful, you’ll see:

Server running on port 3000

-> Flutter App Setup
1️Navigate to Flutter App Folder
cd flutter_app

2️ Install Dependencies
flutter pub get

3️ Update API Base URL

Open your API config file (example):

lib/core/network/dio_client.dart


Set base URL to:

static const String baseUrl = "http://localhost:3000/api";


💡 For Android Emulator use:
http://10.0.2.2:3000/api

4️ Run the App
flutter run

-> Features

View workout list
Workout detail screen
Mark workout as complete
Workout history
Streak tracking

Clean UI with Riverpod state management

🧪 Sample API Endpoints
GET    /api/workouts
POST   /api/users/:userId/workouts/:workoutId/complete
GET    /api/users/:userId/workout-history
GET    /api/users/:userId/workout-streak

