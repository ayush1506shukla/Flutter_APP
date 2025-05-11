# Flutter_APP

A Flutter app built for the BharatNXT Developer Assignment. It fetches and displays a list of articles from a public API, with search and detail view functionality.

---

## Features

- List articles from API
- Client-side search with a button to open first matching article
- Detailed view of selected article
- Loading indicator and error handling
- Clean code with Provider state management

---

## Setup Instructions

1. Clone the repo:
   git clone https://github.com/ayush1506shukla/Flutter_APP.git
   cd flutter_application

2. Install dependencies:
   flutter pub get

3. Run the app:
   flutter run

## Tech Stack

- **Flutter SDK**: 3.19.5  
- **State Management**: Provider  
- **HTTP Client**: http  
- **Persistence**: Not implemented

---

## State Management Explanation

The app uses the **Provider** package for state management. The 'ArticleProvider' class handles fetching articles from the API, maintaining the list of results, applying search filters, and managing loading/error states. It uses 'notifyListeners()' to trigger UI updates whenever the article data or search input changes.

---

## Screenshots (Optional)

> Example:
> Home.jpeg 
> Details.jpeg
