# Krishi Mithra Flutter Frontend

A Flutter mobile application for the Krishi Mithra agricultural assistant.

## Features

- Clean, nature-inspired UI with green theme
- Malayalam greeting support
- Text input with query submission
- Real-time communication with FastAPI backend
- Loading states and error handling

## Setup

1. Make sure you have Flutter installed on your system
2. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Backend Integration

The app connects to the FastAPI backend running on `http://localhost:8000` and sends POST requests to the `/query` endpoint with the following format:

```json
{
  "query": "user's question"
}
```

The backend automatically detects the language of the query and responds in the appropriate language (Malayalam for English queries, detected language for others).

## Project Structure

- `lib/main.dart` - App entry point
- `lib/home_screen.dart` - Main UI screen
- `lib/api_service.dart` - HTTP service for backend communication
- `pubspec.yaml` - Dependencies and project configuration

## Dependencies

- `http: ^1.1.0` - For making HTTP requests to the backend
- `cupertino_icons: ^1.0.2` - For iOS-style icons
