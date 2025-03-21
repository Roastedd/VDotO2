# VO2RPG App Blueprint

## Overview

VO2RPG is a running training app inspired by the VDOT O2 app, which uses Jack Daniels' scientifically-validated VDOT training methodology. The app provides personalized training plans based on a runner's current fitness level (VDOT score) and automatically adjusts training paces for optimal improvement. It also includes social features and achievement tracking to gamify the running experience.

## Core Features

### 1. VDOT Calculator
- Calculate current fitness level using recent race results
- Generate personalized training paces
- Track VDOT score improvements over time
- Equivalent race time predictions
- Environmental condition adjustments (temperature, altitude)

### 2. Training Plans
- Base/Fitness (8 weeks)
- 5K Training (12 weeks)
- 10K Training (12 weeks)
- Half Marathon (12 weeks)
- Marathon (15, 18, or 24 weeks)
- Adaptive Training that automatically adjusts plans based on performance

### 3. Workout Types
- Easy Runs (E pace)
- Marathon Pace Runs (M pace)
- Threshold Runs (T pace)
- Intervals (I pace)
- Repetitions (R pace)
- Recovery Runs (R pace)
- Long Runs

### 4. Social Features
- Activity Feed
- Post Workouts
- Share Achievements
- Comments and Likes
- Follow Other Runners

### 5. Achievement System
- Distance-based achievements
- Streak-based achievements
- Speed/pace achievements
- Elevation gain achievements
- Workout completion achievements
- VDOT improvement achievements

## Tech Stack

### Frontend
- **Flutter**: Cross-platform framework for iOS and Android
- **Riverpod**: State management using the @riverpod annotation
- **Freezed**: Immutable state classes and unions
- **Flutter Hooks**: For lifecycle management
- **GoRouter**: Navigation and deep linking
- **fl_chart**: Data visualization
- **geolocator**: GPS tracking for runs
- **flutter_local_notifications**: Workout reminders
- **health**: Integration with Apple Health
- **flutter_background_geolocation**: Background run tracking
- **hive**: Local database storage
- **flutter_animate**: Animation library
- **timeago**: Human-readable time formatting
- **share_plus**: Content sharing

### Backend
- **Supabase**: Backend-as-a-Service for:
  - Authentication
  - PostgreSQL database
  - Storage
  - Realtime subscriptions

## Current Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── training_paces.dart
│   │   └── vdot_constants.dart
│   ├── exceptions/
│   ├── extensions/
│   ├── router/
│   ├── theme/
│   └── utils/
│       ├── vdot_calculator.dart
│       └── pace_calculator.dart
├── data/
│   ├── models/
│   │   ├── achievement.dart
│   │   ├── comment.dart
│   │   ├── profile.dart
│   │   ├── social.dart
│   │   ├── social_post.dart
│   │   ├── training_plan.dart
│   │   ├── user.dart
│   │   ├── vdot_score.dart
│   │   ├── workout.dart
│   │   ├── workout_execution.dart
│   │   └── workout_metrics.dart
│   └── repositories/
│       ├── training_plan_repository.dart
│       └── workout_repository.dart
├── domain/
│   ├── providers/
│   │   ├── auth_provider.dart
│   │   ├── profile_provider.dart
│   │   ├── social_provider.dart
│   │   ├── training_plan_provider.dart
│   │   ├── vdot_provider.dart
│   │   ├── workout_execution_provider.dart
│   │   └── workout_provider.dart
│   └── services/
│       ├── achievement_service.dart
│       ├── adaptive_training_service.dart
│       ├── location_service.dart
│       ├── social_service.dart
│       ├── training_plan_generator.dart
│       └── workout_execution_service.dart
├── presentation/
│   ├── common_widgets/
│   ├── features/
│   │   ├── achievements/
│   │   ├── auth/
│   │   ├── home/
│   │   ├── onboarding/
│   │   ├── profile/
│   │   ├── social/
│   │   ├── training_plan/
│   │   ├── vdot_calculator/
│   │   └── workout/
│   └── screens/
└── main.dart
```

## Database Schema

### Supabase Tables

1. **users**
   - id (PK)
   - email
   - created_at
   - updated_at
   - profile_image_url
   - display_name
   - current_vdot
   - is_deleted

2. **profiles**
   - id (PK)
   - user_id (FK)
   - display_name
   - bio
   - profile_image_url
   - created_at
   - updated_at

3. **vdot_scores**
   - id (PK)
   - user_id (FK)
   - score
   - race_distance
   - race_time
   - assessment_date
   - created_at
   - updated_at

4. **training_plans**
   - id (PK)
   - user_id (FK)
   - plan_type
   - start_date
   - end_date
   - target_race_distance
   - target_race_date
   - current_week
   - current_vdot
   - created_at
   - updated_at
   - is_deleted

5. **workouts**
   - id (PK)
   - training_plan_id (FK)
   - workout_type
   - scheduled_date
   - completed_date
   - status
   - planned_distance
   - planned_duration
   - actual_distance
   - actual_duration
   - average_pace
   - notes
   - created_at
   - updated_at
   - is_deleted

6. **workout_executions**
   - id (PK)
   - workout_id (FK)
   - start_time
   - end_time
   - total_distance
   - total_duration
   - average_pace
   - average_heart_rate
   - max_heart_rate
   - total_calories
   - elevation_gain
   - created_at
   - updated_at

7. **workout_metrics**
   - id (PK)
   - workout_execution_id (FK)
   - timestamp
   - latitude
   - longitude
   - altitude
   - heart_rate
   - pace
   - distance
   - created_at

8. **social_posts**
   - id (PK)
   - user_id (FK)
   - workout_id (FK)
   - content
   - likes_count
   - comments_count
   - created_at
   - updated_at

9. **comments**
   - id (PK)
   - post_id (FK)
   - user_id (FK)
   - content
   - created_at
   - updated_at

10. **likes**
    - id (PK)
    - post_id (FK)
    - user_id (FK)
    - created_at

11. **follows**
    - id (PK)
    - follower_id (FK)
    - following_id (FK)
    - created_at

12. **achievements**
    - id (PK)
    - title
    - description
    - type
    - required_value
    - icon_name
    - created_at
    - updated_at

13. **user_achievements**
    - id (PK)
    - user_id (FK)
    - achievement_id (FK)
    - current_value
    - is_completed
    - completed_at
    - created_at
    - updated_at

## Key Features Implementation

### 1. VDOT Calculator
```dart
class VdotCalculator {
  // Calculates VDOT score based on race performance
  static double calculateVdot({
    required double distance,  // in meters
    required Duration time,    // race time
  }) {
    // Convert time to minutes
    final timeMinutes = time.inSeconds / 60;

    // Calculate velocity in meters per minute
    final velocity = distance / timeMinutes;

    // Daniels formula coefficient
    final double percent = 0.8 +
        0.1894393 * math.exp(-0.012778 * timeMinutes) +
        0.2989558 * math.exp(-0.1932605 * timeMinutes);

    // Calculate VO2
    final vo2 = -4.60 + 0.182258 * velocity + 0.000104 * velocity * velocity;

    // Calculate VDOT
    final vdot = vo2 / percent;

    return vdot;
  }

  // Gets training paces based on VDOT score
  static Map<String, double> getTrainingPaces(double vdot) {
    // Returns paces in seconds per kilometer for:
    // - easy: easy/recovery runs
    // - marathon: marathon pace
    // - threshold: threshold/tempo runs
    // - interval: interval training
    // - repetition: repetition training
  }

  // Gets equivalent race times for standard distances based on VDOT
  static Map<String, Duration> getEquivalentRaceTimes(double vdot) {
    // Returns predicted times for:
    // - 1500m, 1mile, 3k, 5k, 10k, half_marathon, marathon
  }

  // Adjusts VDOT for environmental conditions
  static double adjustVdotForConditions(
      double vdot, double temperature, double altitude) {
    // Adjusts VDOT based on temperature and altitude
  }
}
```

### 2. Adaptive Training Service
```dart
class AdaptiveTrainingService {
  // Analyzes completed workouts and updates the training plan accordingly
  Future<TrainingPlan> adjustTrainingPlan(TrainingPlan plan) async {
    // Analyzes workout performance to determine if VDOT adjustment is needed
    // Applies adjustments to training plan and future workouts
    // Updates plan in repository
  }

  // Analyzes workout performance to determine VDOT adjustments
  double _analyzeWorkoutPerformance(
      List<Workout> completedWorkouts, double currentVdot) {
    // Calculates implied VDOT from recent performances
    // Applies weights based on workout type
    // Returns suggested VDOT adjustment
  }

  // Adjusts upcoming workouts based on new VDOT
  List<Workout> _adjustUpcomingWorkouts(
    List<Workout> workouts,
    double newVdot,
    DateTime currentDate,
  ) {
    // Updates future workouts with new target paces
  }
}
```

### 3. Achievement Service
```dart
class AchievementService {
  // Processes a completed workout and updates achievements
  Future<List<Achievement>> processWorkout(
      Workout workout, WorkoutExecution execution) async {
    // Updates achievements based on workout completion
    // Returns list of newly unlocked achievements
  }

  // Checks and updates distance-based achievements
  Future<List<Achievement>> _checkDistanceAchievements(
      String userId, double distanceMeters) async {
    // Updates progress on distance-based achievements
  }

  // Checks and updates streak-based achievements
  Future<List<Achievement>> _checkStreakAchievements(
      String userId, DateTime completionDate) async {
    // Updates streak counters and checks for achievements
  }

  // Additional methods for other achievement types
}
```

### 4. Social Service
```dart
class SocialService {
  // Posts a workout to the social feed
  Future<SocialPost> postWorkout(
      String userId, Workout workout, String content) async {
    // Creates a social post with workout details
  }

  // Likes a post
  Future<void> likePost(String userId, String postId) async {
    // Adds like to post
  }

  // Comments on a post
  Future<Comment> commentOnPost(
      String userId, String postId, String content) async {
    // Adds comment to post
  }

  // Follows a user
  Future<void> followUser(String followerId, String followingId) async {
    // Creates follow relationship
  }

  // Gets the activity feed for a user
  Future<List<SocialActivity>> getActivityFeed(String userId) async {
    // Returns posts from followed users
  }
}
```

## Training Paces (Jack Daniels' Methodology)

### Easy Pace (E)
- **Intensity**: 59-74% of VO2max or 65-79% of HRmax
- **Purpose**: Build aerobic base, recovery, strengthen heart muscle
- **Variety**: Warm-ups, cool-downs, recovery runs, long runs
- **Sample Workout**: 30-45 minutes E

### Marathon Pace (M)
- **Intensity**: 75-84% of VO2max or 80-90% of HRmax
- **Purpose**: Race pace conditioning for marathon
- **Variety**: Steady runs or long repeats
- **Sample Workout**: 10 minutes E, 60-90 minutes M

### Threshold Pace (T)
- **Intensity**: 83-88% of VO2max or 88-92% of HRmax
- **Purpose**: Improve endurance
- **Variety**: Tempo runs, cruise intervals
- **Sample Workout**: 3 x 1 mile T (1 min rest) or 20 minutes T

### Interval Pace (I)
- **Intensity**: 97-100% of VO2max or 98-100% of HRmax
- **Purpose**: Improve VO2max (aerobic power)
- **Variety**: VO2max intervals (3-5 minutes each)
- **Sample Workout**: 6 x 2 minutes I (1 min jog), 5 x 3 minutes I (2 min jog)

### Repetition Pace (R)
- **Intensity**: Similar to 1500m or mile race pace
- **Purpose**: Improve speed and running economy
- **Variety**: Fast but not all-out running with full recovery
- **Sample Workout**: 8 x 200m R (200m jog) or 4 x 400m R (400m jog)

## Current Dependencies

```yaml
dependencies:
  flutter_riverpod: ^2.6.1
  hooks_riverpod: ^2.4.9
  flutter_hooks: ^0.20.3
  riverpod_annotation: ^2.3.3
  freezed: ^3.0.4
  freezed_annotation: ^3.0.0
  json_annotation: ^4.8.1
  go_router: ^13.1.0
  supabase_flutter: ^2.0.2
  flutter_dotenv: ^5.1.0
  dio: ^5.4.0
  shared_preferences: ^2.2.2
  flutter_secure_storage: ^9.0.0
  intl: ^0.18.1
  logging: ^1.2.0
  fl_chart: ^0.66.0
  cached_network_image: ^3.3.1
  flutter_local_notifications: ^16.3.0
  geolocator: ^10.1.0
  health: ^8.1.0
  flutter_background_geolocation: ^4.13.5
  riverpod_generator: ^2.6.5
  uuid: ^4.2.1
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  path_provider: ^2.1.1
  flutter_animate: ^4.5.2
  timeago: ^3.7.0
  share_plus: ^10.1.4
  riverpod: ^2.6.1

dev_dependencies:
  build_runner: ^2.4.7
  json_serializable: ^6.7.1
  flutter_lints: ^2.0.0
  custom_lint: ^0.7.5
  riverpod_lint: ^2.6.5
```

## Future Enhancements

1. Device Integration
   - Apple Watch
   - Garmin
   - Coros
   - Strava sync

2. Advanced Features
   - Coach integration
   - Team management
   - Custom training plans
   - Advanced analytics
   
3. Gamification
   - In-app rewards
   - Challenges
   - Leaderboards
   - Virtual races

4. Running Form Analysis
   - Cadence tracking
   - Stride length analysis
   - Foot strike patterns
   - Running efficiency scores

5. Audio Coaching
   - Real-time pace feedback
   - Guided interval training
   - Motivational prompts
   - Custom voice coaching