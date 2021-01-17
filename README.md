## Made with

Flutter and Dart. Learn more about flutter from there official [doc](https://flutter.dev/),
for dart from this [link](https://dart.de/).

## Architecture

We have used clean architecture. This will remove the business logic from our UI.
And make our view code much cleaner and readable. And since our business logic is else where
this will help us to work freely on the logic part without worrying about the UI code.
For this we used the BloC package for Flutter. To learn more the package can go through this [link](https://bloclibrary.dev/#/).

## File Structure

We have used modularisation in this project for dividing it based on section.
To know why we should use modularization in a project can go to this [link](https://medium.com/flutter-community/mastering-flutter-modularization-in-several-ways-f5bced19101a).
We have used the modularization division from this github [repository](https://github.com/rrifafauzikomara/MovieApp).

    # Root Project
    .
    |
    ├── lib                                        # Main lib folder.
    │   ├── src                                    # Contains views.
    |   |    └── views                             # Contains UI and the utis.
    |   |         ├── ui                           # Contains all the screens.
    |   |         └── utils                        # The utility directory
    │   └── main.dart
    |
    └── ── core                                    # Core library which will contains all the business logic related work
        │   ├── bindings                           # Contains the interfaces for dependency injection.
        │   ├── bloc                               # Bloc classes for maintaining the state and handling the events.
        │   ├── interface                          # The interface class which will be used to handle the UI related work.
        │   ├── model
        │   ├── services                           # Contains the different services used like the api calls and repositories.
        │   |      ├── api_services                # The main api service for connecting to the server.
        |   |      └── repository                  # A bridge between bloc and the data layer.
        |   |              ├── local_repository    # To retrieve the data from local storage.
        |   |              └── remote_repository   # To retirve the data from remote.
        │   └── utis
        └── shared                                 # Library which contains the common code which will be used everywhere in the project.
        |   └── utils                              # Contains the utility classes and contants.
        |       └── widget                         # Contains the common widget which will be used in different screens.
        └── dependencies                           # Contains the dependencies/packages used in the project.

The above shows the structure used in the application.
For maintaing the code structure we have used analyzer which provides different rules
which should to be followed. To know ablut different lint rules and the ones which are used in
the project can go through this [link](https://dart-lang.github.io/linter/lints/index.html).
We have used lint to maintain the code format throught out the project. And if not followed the
Github action will not allow merge option.

## Cloning

For cloning there are fews steps which needs to be followed so that there will be no issue while
running the project. After downloading the project few command needs to be run from the terminal.

NOTE: You can use single line for running all the command at once. Copy
`flutter clean & flutter pub get & cd core & flutter clean & flutter pub get & flutter packages pub run build_runner build --delete-conflicting-outputs & cd .. & cd dependencies & flutter clean & flutter pub get & cd .. & cd shared & flutter clean & flutter pub get & cd .. & flutter analyze`
this and press enter.

1. `flutter clean`
2. `cd core`
    1. `flutter clean`
3. `cd ..`
4. `cd shared`
    1. `flutter clean`
5. `cd ..`
6. `flutter pub get`
7. `cd core`
    1. `flutter pub get`
    2. `flutter pub run build_runner build`
8. `cd ..`
9. `cd shared`
    1. `flutter pub get`

These command will first clean the project. And the flutter pub get will install the packages used
in each module. In `core` module we need to run the build runner since we have to generate the
files for model classes and for the retrofit for api calls. It might give error sometimes if there
are any conflicts then at that time can use
`flutter packages pub run build_runner build --delete-conflicting-outputs` this command to
delete the conflicting files and generating new one. There are other options also provide by
`build_runner`, can check it [here](https://dart.dev/tools/build_runner).

## Links

There are other links also a flutter dev can go through to learn few things extra or about some other libraries used in the project.

* https://github.com/Solido/awesome-flutter

* https://stuff.greger.io/2019/07/production-quality-flutter-starter-app.html

* https://medium.com/flutter-community/intl-flutter-starter-kit-18415e739fb6

* https://flutter.dev/docs/deployment/cd

* https://dart.dev/guides/language/effective-dart

* https://github.com/ReactiveX/rxdart

* https://pub.dev/packages/bloc

* https://bloclibrary.dev/#/

* https://pub.dev/packages/bloc

* https://medium.com/agileops/flutter-boilerplate-for-newbie-2dd558f8b524

* https://github.com/acelords/flutter-starter-kit

* https://github.com/Solido/awesome-flutter

* https://pub.dev/packages/retrofit

* https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b

* https://pub.dev/packages/get

* https://medium.com/flutter-community/mastering-hero-animations-in-flutter-bc07e1bea327

* [Learn about hero animation](https://www.woolha.com/tutorials/flutter-creating-hero-transition-examples)

## Code Documenation

A code with good documentaion can help other developers to undestand the code much more faster.
So it would be better to follow the dart official documentaion style provide by them. Can go
thorugh this [link](https://dart.dev/guides/language/effective-dart). For better documentation. Its not necessary to
add comment for each and every line. Since in flutter we divide the code in different files some
times the name doesn't actually clarify what does the file/class/methods/variable does. So if
required the docmentation must be added.

wiki_search