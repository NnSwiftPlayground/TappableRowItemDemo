# TappableRowItemDemo

A SwiftUI project demonstrating reusable view modifiers for building tappable, selectable list rows with consistent layout and appearance.

## The Problem

In SwiftUI, making list rows tappable or consistently styled often leads to:

- Repeated `HStack` layouts to align content and accessory views (like chevrons).
- Boilerplate tap gesture handling scattered across different list items.
- Difficulty in keeping interaction areas large and consistent without manually managing `.contentShape`.
- Inconsistent application of row styling across different screens.

These small details can lead to messy, hard-to-maintain view structures and inconsistent UX across an app.

## Common Scenario

- You want a list row to trigger navigation or actions when tapped.
- You want a consistent way to show a chevron or other accessory.
- You want list rows to support selection/deselection cleanly.
- You want tap gestures to apply only when certain conditions are met (e.g., `isEnabled`).

## This Project’s Solution

This demo introduces a set of simple, composable view modifiers that cleanly manage row layout and interaction in SwiftUI:

### `asRowItem`

```swift
Text(category.name)
    .asRowItem(withChevron: true)
```
- Wraps a view in a horizontal layout, optionally adding a trailing chevron.
- Ensures consistent spacing, alignment, and tappable area.
- Customizable `alignment`, `maxWidth`, `tint`, and `withChevron` behavior.

### `tappable`

```swift
Text(item.name)
    .tappable(withChevron: true) {
        path.append(item)
    }
```
- Makes a view tappable by attaching a tap gesture.
- Automatically applies the `asRowItem` layout underneath.
- Supports enabling/disabling the tap gesture dynamically with `tapIsActive`.
- Keeps tap handling and layout cleanly separated from view content.

## Demo Project Includes

Two full examples:

- **Navigation flow**: Tap on a category to navigate to a detail view.
- **Selection flow**: Tap on an item to select or deselect it, with a checkmark appearing for selected items. Save your selections back to the category.

These examples mirror real-world needs for building clean, scalable list UIs in SwiftUI.

## Key Features

| Feature | Description |
|:--------|:------------|
| Consistent Row Layout | Automatically formats content into a clean horizontal stack with optional trailing icons. |
| Tappable Interaction | Makes any row tappable without manually attaching gestures everywhere. |
| Dynamic Chevron Support | Easily toggle a chevron indicator on or off based on context. |
| Optional Tap Activation | Control whether taps are enabled without changing view structure. |

## Why This Matters

Rather than writing new `HStack` layouts or ad hoc `.onTapGesture` calls for each list item, these view modifiers offer a **centralized, reusable** solution for tappable row behavior.

This approach improves:

- Readability
- Maintainability
- Scalability across growing SwiftUI apps

These modifiers are part of [NnSwiftUIKit](https://github.com/nikolainobadi/NnSwiftUIKit), a collection of custom SwiftUI view modifiers and utilities.
