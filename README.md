# [feastfinders.net](restaurant-randomizer-506122.web.app) (previously known as Randomized Restaurant)


A multi-platform tool for choosing where to eat when you simply cannot choose.

Pick the kinds of food you're in the mood for (or don't, if anything works for you), hit randomize, and the app finds nearby restaurants using the Google Places API and chooses one for you. Don't like the pick? Roll again.


## Features

- **Randomize** – picks a random nearby restaurant based on your current location
- **Filters** – narrow results by cuisine/venue type (sourced from Google's
  [Place Types](https://developers.google.com/maps/documentation/places/web-service/place-types#table-a))
- **Result navigation** – step forward to a new pick or back to a previous one
- **Restaurant details** – hours, rating, price level, amenities (dine-in, takeout, outdoor seating,
  etc.), and a link out to Google Maps
- **Favorites** – save restaurants you like, no account required!

### Planned

- Android and iOS native app releases
- User accounts for cross-device favorites
- Adjustable search radius
- Toggling between dark and light modes


## Tech Stack

| Area              | Package                                              |
| ----------------- | ---------------------------------------------------- |
| Framework         | [Flutter](https://flutter.dev)                       |
| State management  | `flutter_riverpod` + `riverpod_generator`            |
| Routing           | `go_router`                                          |
| Networking        | `dio`                                                |
| Local storage     | `drift` (SQLite)                                     |
| Location          | `geolocator`                                         |
| Environment/keys  | `envied`                                             |
| Restaurant data   | [Google Places API (New)](https://developers.google.com/maps/documentation/places/web-service/overview) |

## Deployment
The web version of this app is deployed to Firebase Hosting through GitHub Actions, which can be reached at https://restaurant-randomizer-506122.web.app

## Limitations
- Currently, all searches are limited to a fixed 5km radius
- Each search returns at most 20 restaurants
A multi-platform tool for choosing where to eat when you simply cannot choose.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart SDK `^3.13.1`)
- A Google Cloud project with the **Places API (New)** enabled and an API key

### Setup

1. Clone the repository and install dependencies:

   ```sh
   git clone https://github.com/BaileyLoso/randomized_restaurant.git
   cd randomized_restaurant
   flutter pub get
   ```

2. Create a `.env` file in the project root by copying `.env.example`, then fill in the values:

   ```env
   # Google Places API
   BASE_URL=https://places.googleapis.com/v1/
   TEXT_SEARCH_URL=https://places.googleapis.com/v1/places:searchText
   NEARBY_SEARCH_URL=https://places.googleapis.com/v1/places:searchNearby
   API_KEY=<your-api-key>
   ```

   `.env` and the generated `lib/env.g.dart` are git-ignored. Never commit them.

3. Run code generation (Riverpod providers, Drift database, and `envied`):

   ```sh
   dart run build_runner build
   ```

   Re-run this whenever you change `.env` or any annotated provider/table.

4. Run the app:

   ```sh
   flutter run
   ```

   Location permission is required to find nearby restaurants.