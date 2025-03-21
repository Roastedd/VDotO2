# Flutter Development Best Practices

I am an expert in Flutter, Dart, Riverpod, and Supabase development. When helping with Flutter projects, I follow these best practices and guidelines:

## Core Principles
- Write concise, technical Dart code with accurate examples
- Use functional and declarative programming patterns where appropriate
- Prefer composition over inheritance
- Use descriptive variable names with auxiliary verbs (e.g., isLoading, hasError)
- Structure files: exported widget, subwidgets, helpers, static content, types
- Follow SOLID principles, especially single responsibility

## Architecture
- Implement clear separation between UI and data layers
- Use repository pattern in the data layer to isolate data access logic
- Follow MVVM pattern with ViewModels and Views in the UI layer
- Use unidirectional data flow (data layer → UI layer)
- Implement abstract repository classes for better testability
- Use dependency injection to avoid global state

## Dart/Flutter Fundamentals
- Use const constructors for immutable widgets to optimize rebuilds
```dart
const MyWidget(key: Key('unique_key'));
```
- Leverage free packages like Freezed for immutable state classes
- Use arrow syntax for simple functions and methods
```dart
void doSomething() => print('Done');
```
- Prefer expression bodies for one-line getters and setters
```dart
String get fullName => '$firstName $lastName';
```
- Use trailing commas for better formatting and diffs
- Follow Flutter's official style guide for consistent code

## State Management with Riverpod
- Use @riverpod annotation for generating providers (riverpod_generator)
```dart
@riverpod
Future<List<Todo>> todos(TodosRef ref) async {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.fetchTodos();
}
```
- Prefer AsyncNotifierProvider and NotifierProvider for most state needs
- Avoid StateProvider, StateNotifierProvider, and ChangeNotifierProvider
- Use ref.invalidate() for manually triggering provider updates
- Implement proper cancellation of asynchronous operations when widgets are disposed
- Leverage AsyncValue for proper error handling and loading states
```dart
return todosAsync.when(
  data: (todos) => TodoListView(todos: todos),
  loading: () => const CircularProgressIndicator(),
  error: (error, stack) => ErrorDisplay(error: error),
);
```

## Error Handling and Validation
- Implement error handling in views using SelectableText.rich for better UX
```dart
SelectableText.rich(
  TextSpan(
    text: error.toString(),
    style: TextStyle(color: Theme.of(context).colorScheme.error),
  ),
)
```
- Display errors with appropriate color contrast for accessibility
- Handle empty states within the displaying screen
- Implement proper error boundaries to prevent cascading failures
- Use try/catch blocks with specific exception types
```dart
try {
  await repository.saveData(data);
} on NetworkException catch (e) {
  // Handle network errors specifically
} on ValidationException catch (e) {
  // Handle validation errors
} catch (e) {
  // Handle other errors
}
```

## Navigation and Routing
- Use GoRouter (free) for navigation and deep linking
```dart
GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) => DetailsScreen(
        id: state.pathParameters['id']!,
      ),
    ),
  ],
)
```
- Implement proper route guards for authenticated routes
- Use named routes for better maintainability
- Implement deep link handling for better user experience

## UI and Styling
- Use Flutter's built-in widgets and create custom widgets
- Implement responsive design using LayoutBuilder or MediaQuery
```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return WideLayout();
    } else {
      return NarrowLayout();
    }
  },
)
```
- Use themes for consistent styling across the app
- Follow Material 3 guidelines for modern UI components
- Use Theme.of(context).textTheme.titleLarge instead of deprecated names
- Implement proper dark mode support

## Performance Optimization
- Use const widgets where possible to optimize rebuilds
- Implement list view optimizations (e.g., ListView.builder)
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ItemTile(item: items[index]),
)
```
- Use AssetImage for static images and cached_network_image for remote images
```dart
CachedNetworkImage(
  imageUrl: url,
  placeholder: (context, url) => const CircularProgressIndicator(),
  errorWidget: (context, url, error) => const Icon(Icons.error),
)
```
- Implement proper image caching strategies
- Use DevTools to identify and fix performance bottlenecks
- Implement proper widget rebuilding strategies (avoid unnecessary rebuilds)

## Backend Integration with Supabase
- Use Supabase (free tier available) for backend services
```dart
final data = await supabase
    .from('todos')
    .select()
    .eq('user_id', userId)
    .order('created_at');
```
- Implement proper error handling for Supabase operations
- Use Row Level Security for data protection
```sql
CREATE POLICY "Users can only access their own data"
ON todos
FOR SELECT
USING (auth.uid() = user_id);
```
- Implement proper authentication flows
- Use Supabase realtime features efficiently

## Model and Database Conventions
- Include createdAt, updatedAt, and isDeleted fields in database tables
- Use @JsonSerializable(fieldRename: FieldRename.snake) for models
```dart
@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String id;
  final String displayName;
  final DateTime createdAt;
}
```
- Implement @JsonKey(includeFromJson: true, includeToJson: false) for read-only fields
- Use @JsonValue(int) for enums that go to the database
```dart
enum UserRole {
  @JsonValue(0)
  user,
  @JsonValue(1)
  admin,
}
```
- Follow database normalization principles

## Widgets and UI Components
- Create small, private widget classes instead of methods like Widget _build...
```dart
class _UserAvatar extends StatelessWidget {
  const _UserAvatar({required this.url});
  final String url;
  
  @override
  Widget build(BuildContext context) => /* ... */
}
```
- Implement RefreshIndicator for pull-to-refresh functionality
- In TextFields, set appropriate textCapitalization, keyboardType, and textInputAction
```dart
TextField(
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next,
  decoration: const InputDecoration(labelText: 'Email'),
)
```
- Always include an errorBuilder when using Image.network
- Use SliverList and SliverGrid for complex scrollable layouts

## Testing and Quality Assurance
- Write unit tests for business logic
```dart
test('should calculate total correctly', () {
  final calculator = PriceCalculator();
  expect(calculator.calculateTotal([10, 20, 30]), 60);
});
```
- Write widget tests for UI components
- Use integration tests for critical user flows
- Implement proper mocking for dependencies
- Use GitHub Actions (free) for CI/CD

## Miscellaneous
- Use logging package instead of print for debugging
```dart
final _logger = Logger('MyClass');
_logger.info('Operation completed');
```
- Use Flutter Hooks / Riverpod Hooks where appropriate
```dart
final counter = useState(0);
final controller = useTextEditingController();
```
- Keep lines no longer than 80 characters
- Add commas before closing brackets for multi-parameter functions
- Use lint rules to enforce code quality (flutter_lints package)

## Code Generation
- Utilize build_runner for generating code from annotations
- Run 'flutter pub run build_runner build --delete-conflicting-outputs' after modifying annotated classes
- Use json_serializable for JSON serialization
- Use freezed for immutable state classes
```dart
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required DateTime createdAt,
  }) = _User;
  
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
```

## Documentation
- Document complex logic and non-obvious code decisions
- Use dartdoc comments for public APIs
```dart
/// Calculates the total price including tax and discounts.
/// 
/// [items] must not be empty.
/// Returns the calculated total or throws [EmptyCartException].
double calculateTotal(List<CartItem> items) {
  // ...
}
```
- Create README files for major features
- Follow official Flutter, Riverpod, and Supabase documentation

## Recommended Free/Open Source Packages
- **State Management**: riverpod, flutter_riverpod, riverpod_generator
- **Routing**: go_router
- **HTTP Client**: dio or http
- **Local Storage**: shared_preferences, hive
- **Immutable Models**: freezed
- **Form Validation**: formz
- **Internationalization**: intl
- **Image Loading**: cached_network_image
- **Backend**: supabase_flutter
- **Logging**: logging
- **Testing**: mockito, mocktail
- **UI Components**: flutter_hooks
- **Charts**: fl_chart
- **Animations**: flutter_animate
- **Icons**: font_awesome_flutter
- **Dependency Injection**: get_it (with riverpod)
- **Code Quality**: flutter_lints, very_good_analysis
- **Project Templates**: very_good_cli

When generating code, I'll follow these guidelines to ensure high-quality, maintainable Flutter applications. 

# Cursor Development Rules

## Documentation First Approach
1. **Check Official Documentation**
   - Review Flutter documentation at docs.flutter.dev
   - Check Apple Human Interface Guidelines for iOS/macOS
   - Verify Material Design guidelines for Android
   - Review package documentation on pub.dev

2. **Package Compatibility**
   - Verify package compatibility with current Flutter version
   - Check package maintenance status and last update
   - Review package issues on GitHub
   - Ensure null safety compliance
   - Check platform support (iOS, Android, web, etc.)

3. **Apple Design Guidelines Integration**
   - Follow Apple HIG for iOS/macOS components
   - Implement proper accessibility features
   - Use appropriate typography and text styles
   - Follow platform-specific navigation patterns
   - Implement proper dark mode support
   - Use appropriate color schemes and contrasts

4. **Flutter Best Practices**
   - Use latest Flutter stable version features
   - Implement proper state management (Riverpod)
   - Follow widget composition best practices
   - Use const constructors where possible
   - Implement proper error boundaries
   - Follow Flutter performance guidelines

5. **Code Structure**
   - Organize code by feature
   - Separate business logic from UI
   - Use proper layered architecture
   - Implement repository pattern
   - Follow SOLID principles

6. **Testing Requirements**
   - Write unit tests for business logic
   - Implement widget tests for UI components
   - Add integration tests for critical flows
   - Test accessibility features
   - Test platform-specific features

7. **Performance Guidelines**
   - Use Flutter DevTools for performance monitoring
   - Implement proper list view optimizations
   - Use appropriate image caching strategies
   - Minimize unnecessary rebuilds
   - Follow memory management best practices

8. **Security Best Practices**
   - Implement secure storage for sensitive data
   - Use proper authentication flows
   - Follow platform security guidelines
   - Implement proper API key management
   - Use secure communication protocols

9. **Accessibility Requirements**
   - Support VoiceOver and TalkBack
   - Implement proper semantic labels
   - Use appropriate contrast ratios
   - Support dynamic type sizes
   - Implement proper navigation for screen readers

10. **Version Control**
    - Use meaningful commit messages
    - Follow Git branch naming conventions
    - Implement proper PR review process
    - Document breaking changes
    - Maintain changelog

11. **Error Handling**
    - Implement proper error boundaries
    - Use meaningful error messages
    - Handle platform-specific errors
    - Implement proper logging
    - Follow error recovery patterns

12. **Documentation**
    - Document public APIs
    - Add code comments for complex logic
    - Maintain README files
    - Document environment setup
    - Include usage examples

13. **Responsive Design**
    - Support different screen sizes
    - Implement proper layout constraints
    - Use appropriate breakpoints
    - Support orientation changes
    - Handle notches and safe areas

14. **State Management**
    - Use Riverpod for state management
    - Implement proper provider scoping
    - Handle loading and error states
    - Manage app lifecycle
    - Follow unidirectional data flow

15. **Dependency Management**
    - Keep dependencies up to date
    - Use semantic versioning
    - Document dependency purposes
    - Handle dependency conflicts
    - Minimize package dependencies

16. **Platform Integration**
    - Handle platform-specific features properly
    - Implement proper permissions handling
    - Support platform notifications
    - Handle deep linking
    - Implement proper platform channels

17. **Internationalization**
    - Use proper i18n patterns
    - Support RTL languages
    - Handle number formatting
    - Support date/time formatting
    - Implement proper string resources

18. **Asset Management**
    - Use appropriate image resolutions
    - Implement proper font handling
    - Optimize asset sizes
    - Use vector graphics where possible
    - Implement proper asset caching

19. **Code Quality**
    - Use Flutter lints
    - Follow style guide
    - Implement code formatting
    - Use static code analysis
    - Regular code reviews

20. **Deployment**
    - Follow platform deployment guidelines
    - Implement proper signing
    - Handle app store requirements
    - Maintain release notes
    - Version management 

## Free and Open Source Software (FOSS) Requirements
1. **Package Selection Criteria**
   - Use only free and open-source packages
   - Verify license compatibility (MIT, Apache 2.0, BSD preferred)
   - Check package source code availability
   - Ensure no proprietary dependencies
   - Verify package sustainability

2. **License Compliance**
   - Document all package licenses
   - Include license attributions
   - Follow license requirements
   - Maintain license compatibility
   - Track license changes

3. **Community Engagement**
   - Contribute bug fixes upstream
   - Report issues to package maintainers
   - Participate in package discussions
   - Share improvements with community
   - Support package maintenance

## Recommended Free/Open Source Packages
- **State Management**
  - riverpod (MIT)
  - flutter_riverpod (MIT)
  - riverpod_generator (MIT)
  - provider (MIT)

- **Routing**
  - go_router (BSD-3)
  - auto_route (MIT)

- **HTTP Client**
  - dio (MIT)
  - http (BSD-3)

- **Local Storage**
  - shared_preferences (BSD-3)
  - hive (Apache 2.0)
  - sqflite (MIT)

- **Data Modeling**
  - freezed (MIT)
  - json_serializable (BSD-3)
  - built_value (BSD-3)

- **Form Validation**
  - formz (MIT)
  - form_builder_validators (MIT)

- **Internationalization**
  - intl (BSD-3)
  - easy_localization (MIT)

- **Image Loading**
  - cached_network_image (MIT)
  - flutter_cache_manager (MIT)

- **Backend**
  - supabase_flutter (MIT)
  - appwrite (BSD-3)
  - firebase_core (BSD-3)

- **Logging**
  - logging (BSD-3)
  - logger (MIT)

- **Testing**
  - mockito (Apache 2.0)
  - mocktail (MIT)
  - flutter_test (BSD-3)

- **UI Components**
  - flutter_hooks (MIT)
  - flutter_svg (MIT)
  - shimmer (MIT)

- **Charts**
  - fl_chart (MIT)
  - syncfusion_flutter_charts (Community Edition - MIT)
  - charts_flutter (Apache 2.0)

- **Animations**
  - flutter_animate (MIT)
  - rive (MIT)
  - lottie (Apache 2.0)

- **Icons**
  - font_awesome_flutter (MIT)
  - material_design_icons_flutter (MIT)
  - feather_icons (MIT)

- **Dependency Injection**
  - get_it (MIT)
  - injectable (MIT)

- **Code Quality**
  - flutter_lints (BSD-3)
  - very_good_analysis (MIT)
  - dart_code_metrics (MIT)

- **Project Templates**
  - very_good_cli (MIT)
  - mason (MIT)

- **Database**
  - drift (MIT)
  - isar (Apache 2.0)
  - objectbox (Apache 2.0)

- **API Integration**
  - retrofit (MIT)
  - chopper (MIT)

- **State Persistence**
  - hydrated_bloc (MIT)
  - streaming_shared_preferences (MIT)

4. **Package Evaluation Checklist**
   - [ ] Verify package is open source
   - [ ] Check license compatibility
   - [ ] Review GitHub activity
   - [ ] Check issue resolution time
   - [ ] Verify Flutter version compatibility
   - [ ] Review package documentation
   - [ ] Check test coverage
   - [ ] Verify null safety support
   - [ ] Review security vulnerabilities
   - [ ] Check platform support

5. **Package Maintenance**
   - Monitor package updates
   - Track breaking changes
   - Review changelogs
   - Update dependencies regularly
   - Contribute to package maintenance 