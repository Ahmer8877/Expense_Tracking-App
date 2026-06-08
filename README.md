# Personal Expense Tracking Service

A modern Flutter application for managing and tracking personal expenses. The app helps users record daily expenses, monitor spending habits, and analyze financial data through visual charts and summaries.

## Features

### Expense Management

* Add new expenses
* Edit existing expenses
* Delete expenses
* View all expenses in a clean list
* Sort expenses by latest date

### Expense Details

Each expense contains:

* Title
* Amount
* Category
* Date
* Notes

### Analytics Dashboard

* Total expenses overview
* Total transaction count
* Highest expense tracking
* Category-wise spending breakdown
* Monthly expense analytics
* Pie chart visualization
* Bar chart visualization

### Search & Filtering

* Search expenses by title
* Filter by category
* Organized expense records

### User Experience

* Responsive mobile UI
* GetX state management
* Dark mode support
* Smooth navigation
* Form validation

### Local Storage

* Hive database integration
* Offline-first functionality
* Persistent data storage
* Data remains available after app restart

## Tech Stack

### Framework

* Flutter

### State Management

* GetX

### Local Database

* Hive
* Hive Flutter

### Charts

* FL Chart

### Architecture

* MVC-inspired folder structure
* Separation of UI, controllers, models, and widgets

## Project Structure

```text
lib/
├── core/
│   ├── constant/
│   └── theme/
│
├── data/
│   ├── controller/
│   └── models/
│
├── views/
│   └── screens/
│
├── widgets/
│
└── main.dart
```

## Screens

### Dashboard Screen

* Total expense summary
* Quick navigation
* Recent expenses

### Add Expense Screen

* Create new expense records
* Validation support

### Expense List Screen

* View all expenses
* Edit and delete actions

### Summary Screen

* Spending analytics
* Category breakdown
* Charts and statistics

## Packages Used

* get
* hive
* hive_flutter
* hive_generator
* build_runner
* fl_chart

## Installation

1. Clone the repository

```bash
git clone https://github.com/your-username/personal-expense-tracking-service.git
```

2. Install dependencies

```bash
flutter pub get
```

3. Generate Hive adapters

```bash
dart run build_runner build --delete-conflicting-outputs
```

4. Run the application

```bash
flutter run
```

## Future Improvements

* PDF report export
* Firebase authentication
* Cloud synchronization
* Budget planning
* Multi-user support
* Expense reminders
* Advanced analytics

## Author

AHMIR SHAFIQUE 

Flutter Developer
