<h1 style="color:#FF6347;">🌍 Dream Destination Tracker</h1>

Welcome to the **Dream Destination Tracker**, a Swift application that lets you store and track details about your dream travel destinations. This project uses **UserDefaults** to save data on whether you've visited a location, how many times you've visited, and the name of the destination.

---

<h2 style="color:#4682B4;">🔍 Table of Contents</h2>

1. <a href="#project-overview" style="color:#4682B4;">Project Overview</a>
2. <a href="#features" style="color:#4682B4;">Features</a>
3. <a href="#classes-and-structures" style="color:#4682B4;">Classes and Structures</a>
4. <a href="#functions" style="color:#4682B4;">Functions</a>
5. <a href="#usage-example" style="color:#4682B4;">Usage Example</a>

---

<h2 id="project-overview" style="color:#FF6347;">📖 Project Overview</h2>

The **Dream Destination Tracker** app is a simple user interface for saving and retrieving travel destination information using **UserDefaults**. You can enter a destination, track if you’ve visited it, and specify how many times you've visited. This app provides a smooth experience for storing and displaying this information upon each app launch.

---

<h2 id="features" style="color:#4682B4;">✨ Features</h2>

This application includes several key features:

- **Save** dream destination details including name, visit status, and visit count.
- **Retrieve** saved destination details on launch.
- **Validate** user input to ensure correct information format.
- **Display** saved data with intuitive UI elements.

---

<h2 id="classes-and-structures" style="color:#FF6347;">🏗️ Classes and Structures</h2>

This project is organized with a single **ViewController** class, which contains functions to manage and validate data entry:

- **visitedKey**, **visitCountKey**, **destinationNameKey**: Constants for UserDefaults keys.
- **@IBOutlet**: Connections for text fields to display and input destination details.

---

<h2 id="functions" style="color:#4682B4;">⚙️ Functions</h2>

Here’s a breakdown of the main functions in this project:

1. **saveDreamDestination(hasVisited: Bool, visitCount: Int, destinationName: String)** - Saves the entered destination details to UserDefaults.
2. **retrieveDreamDestination()** - Retrieves and displays saved destination information from UserDefaults.
3. **logDreamDestination(hasVisited: Bool, visitCount: Int, destinationName: String)** - Logs the details of the destination to the console.
4. **isValidInput()** - Checks if user input is valid, including format validation for visited status and visit count.
5. **showAlert(title: String = "Info", message: String)** - Displays alerts to guide user input and display save success messages.

---

<h2 id="usage-example" style="color:#FF6347;">💡 Usage Example</h2>

Here is how the **Dream Destination Tracker** works in practice:

```swift
// Saving a destination
let destinationName = "Paris"
let hasVisited = true
let visitCount = 3

saveDreamDestination(hasVisited: hasVisited, visitCount: visitCount, destinationName: destinationName)

// Retrieving the destination details
retrieveDreamDestination()  // This updates the text fields to display "Paris", "Yes", and "3" respectively

// Console Output
// Dream Destination: Paris
// Have visited before: true
// Times visited: 3
