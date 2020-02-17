### Assignment 5 Grade

#### Model
| Points | Description |
| :--- | :--- |
| 1/1 | Reads data from `Data.plist` 
| 1/1 | Manages data in `DataManager` singleton pattern
| 1/1 | Uses `UserDefaults` for persistent storage

#### Custom Protocol
| Points | Description |
| :--- | :--- |
| 1/1 | Declares `PlacesFavoritesDelegate` protocol
| 1/1 | Defines and uses `delegate` variable in `FavoritesViewController`
| 1/1 | Conforms to protocol in `MapsViewController`
| 1/1 | Implements the `favoritePlace()` function that updates labels and zooms to favorite location
| 1/1 | Data is successfully send back

#### Adaptive Layout
| Points | Description |
| :--- | :--- |
| 1/1 | Map is full screen in all orientations and devices
| 1/1 | HUD view labels and stars are positioned using constraints
| 1/1 | HUD view height and width adjust to size class. Description label fills all vertical height.
| 0/1 | Favorites button vertical height is decreased in landscape.

#### MapViewController
| Points | Description |
| :--- | :--- |
| 1/1 | Initial region is Chicago
| 1/1 | Map view is muted style
| 1/1 | HUD has text labels and star button
| 1/1 | Star button toggles favorite state and shows selected/unselected fill
| 1/1 | "Favorites" button at bottom of screen modally presents `FavoritesViewController`

#### Map Annotations
| Points | Description |
| :--- | :--- |
| 1/1 | Annotations come from `Data.plist`
| 1/1 | Create `Place` subclass with `name` and `description` properties
| 1/1 | Create `PlaceMarkerView` custom annotation with _styling_
| 1/1 | Implement `didSelect()` method to receive touch and update the HUD view
| 1/1 | Annotations are places on the map in the correction location

#### FavoritesViewController
| Points | Description |
| :--- | :--- |
| 1/1 | Controller is presented modally
| 1/1 | `UITableView` shows the favorite places (no specific requirement on cell design)
| 1/1 | Contains a `UIButton` near the top of the controller to dismiss
| 1/1 | Table cell tap dismisses the view controller and passes data back using the protocol

#### Best Practices 
| Points | Description |
| :--- | :--- |
| 1/1 | Follows Swift and iOS best practices
| 1/1 | Uses separate files for new classes (eg. annotations, views, singletons, etc.)

#### Extra Credit
| Points | Description |
| :--- | :--- |
| 0/2 | Add local notification for when a user enters a region

#### Comments

Nice work with functionality 👍🏻

-0.5 leave your PR open

Your code architecture is well thought out. Helper methods to delegate indivudual tasks, e.g. `func zoomPlace(place: Place)` and `func updateInfoView(place: Place)`. Well-named properties and methods, so that when I read them, I immediately know what their purpose is. Keep it up.

You could be more concise with this snippet:
```
if favPlaces.contains(selectedPlace.name!) {
  favoriteButton.isSelected = true
} else {
  favoriteButton.isSelected = false
}
```

We don't _need_ the Bool literals here. Instead, we can just write:
```
favoriteButton.isSelected = favPlaces.contains(selectedPlace.name!)
```

#### Grade
28.5/30
