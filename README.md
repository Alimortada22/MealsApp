# meals_app

A Flutter application that allows users to browse various meal categories, select meals, read their ingredients and instructions, and mark meals as favorites. Users can switch between all meals and favorited meals, as well as apply various filters to customize their meal view. The app features animations for a smoother user experience.

## Features

- Browse various meal categories.
- View meal details, including ingredients and instructions.
- Mark meals as favorites for easy access.
- Switch between all meals and favorited meals.
- Filter meals based on specific criteria (e.g., category, dietary restrictions).
- Smooth animations using Hero transitions and button animations.

## Dependencies

Make sure to include the following dependencies in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  riverpod: ^latest_version           # For state management
  animation_builder: ^latest_version   # For animation effects
  http: ^latest_version                # For fetching meal data from an API
```

Replace `latest_version` with the current version of each package.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/meal-browser-app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd meal-browser-app
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## Usage

- Launch the app to view a list of meal categories.
- Select a meal to view its ingredients and cooking instructions.
- Mark meals as favorites by tapping the favorite icon.
- Switch between the "All Meals" view and "Favorites" view.
- Access the filters page to customize the meal selection based on your preferences.
- Enjoy smooth animations while navigating through the app!

## Demo video



https://github.com/user-attachments/assets/d59d9ae5-704d-4bcb-b0c2-0a52f0a34439



## Contributing

We welcome contributions! Please feel free to open issues and submit pull requests.

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev) - UI toolkit for building natively compiled applications.
- [Riverpod](https://riverpod.dev) - For state management.
- [Animation Builder](https://pub.dev/packages/animation_builder) - For creating animations.
- [HTTP](https://pub.dev/packages/http) - For fetching data from APIs.

---

Feel free to customize this README further to match your app's unique features and requirements! Let me know if you need any more adjustments or additions!
