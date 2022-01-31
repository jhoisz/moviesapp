# Movies App :movie_camera:


## Description
This is a flutter application that displays a list of the most popular movies, in addition to the release date, average votes and the summary of each movie. The data is taken from the [**TMDb API**](https://developers.themoviedb.org/3).

## technologies
This project was developed with the following technologies:
- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

## Layout
The layout of the project can be seen in [this link](https://www.figma.com/file/ekY4kBHaMnSN1kfz6aP4n0/Cine?node-id=0%3A1), you need to create an account on [Figma](https://www.figma.com/).


## How to Install and Run the Project
First you must [install flutter](https://docs.flutter.dev/get-started/install).

Then clone the project repository and enter the project folder:
```bash
git clone https://github.com/jhoisz/moviesapp.git
cd moviesapp
```

Now for testing you can connect a device to your computer or use an emulator. Install the dependencies and start the application:

```bash
flutter pub get
flutter run
```

## Third-party Libraries Used

- [**google_fonts**](https://pub.dev/packages/google_fonts): allows the use of fonts provided by fonts.google.com.
- [**dio**](https://pub.dev/packages/dio): makes it possible to make requests to the API.
- [**cached_network_image**](https://pub.dev/packages/cached_network_image): keeps the internet images used in the application cached in the directory.
- [**flutter_bloc**](https://pub.dev/packages/flutter_bloc): used to make the application more organized, separating business rules from the user interface using events and consequences.

## Application Screenshots 

![Screenshots](https://github.com/jhoisz/moviesapp/blob/main/screenshots/app.png)