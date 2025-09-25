#find . -name "*.g.dart" -type f -delete
#flutter clean
#flutter pub get
#flutter packages pub run build_runner build --delete-conflicting-outputs
#dart format .

#!/bin/bash

# Clean the main project
flutter clean

# Clean each package and the main project
for package in $(find . -name "pubspec.yaml" -exec dirname {} \;); do
  echo "Cleaning package: $package"
  (cd "$package" && flutter clean)
done

# Get dependencies for the main project
flutter pub get

# Get dependencies for each package
for package in $(find . -name "pubspec.yaml" -exec dirname {} \;); do
  echo "Getting dependencies for package: $package"
  (cd "$package" && flutter pub get)
done

# Generate files for the main project
flutter packages pub run build_runner build --delete-conflicting-outputs

# Generate files for each package
for package in $(find . -name "pubspec.yaml" -exec dirname {} \;); do
  echo "Generating files for package: $package"
  (cd "$package" && flutter packages pub run build_runner build --delete-conflicting-outputs)
done

# Format the Dart files in the main project
dart format .

# Format the Dart files in each package
for package in $(find . -name "pubspec.yaml" -exec dirname {} \;); do
  echo "Formatting Dart files in package: $package"
  (cd "$package" && dart format .)
done

echo "All done!"
