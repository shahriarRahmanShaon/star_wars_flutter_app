# SWAPI Explorer 🚀

**SWAPI Explorer** is a Flutter-based Star Wars character browser application that provides users with a seamless experience to explore Star Wars characters, search dynamically, and view detailed character information. The app is built with a **clean MVVM architecture**, ensuring modularity, efficiency, and scalability.

---

## 🌟 Features

- **Character Dashboard**: Browse and explore characters from the **SWAPI API**.
- **Character Details Page**: View detailed information such as height, mass, birth year, films, and homeworld.
- **Search Functionality with Debounce**: Find characters quickly with an optimized debounce search input.
- **Pagination Support**: Smoothly navigate between character pages.
- **GridView Design**: Beautifully structured character cards in a responsive **GridView**.
- **Navigation with GoRouter**: Clean and efficient routing with **named routes**.
- **State Management with Provider**: Centralized state handling using **Provider**.
- **Singleton-based Repository Pattern**: Ensuring optimized API calls and data management.
- **App Theme Support**: Toggle between **light and dark modes**.
- **Animated UI Elements**: Smooth transitions and animations for a better user experience.
- **Side Drawer Navigation**: Access important sections like **Home, About, and Settings**.
- **Shared Preference for theme persisting**: Theme persistance even after you close the app through shared preference.


---
## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/68f52bdc-6c43-470e-910a-076b2c11170e" width="300">
  <img src="https://github.com/user-attachments/assets/0473509a-237c-44e2-8671-5c28d173d197" width="300">
  <img src="https://github.com/user-attachments/assets/1b3601bf-d1c8-4d9d-a305-80c611a12844" width="300">
  <img src="https://github.com/user-attachments/assets/2b21b701-11c9-4f9f-b677-8709710340dd" width="300">
  <img src="https://github.com/user-attachments/assets/19eccdfb-aefb-41d1-86c0-d32553b1031e" width="300">
  <img src="https://github.com/user-attachments/assets/2afd09b3-1b23-4051-b4b9-bcc8be3a0974" width="300">
  <img src="https://github.com/user-attachments/assets/d9ea3e83-f76d-46b5-82a5-b0dba11ef150" width="300">
  <img src="https://github.com/user-attachments/assets/15425475-7db4-46d0-b7d8-d7add19ecb54" width="300">
  <img src="https://github.com/user-attachments/assets/d96528e7-aea5-467f-af95-519bb2cdfcc3" width="300">
  <img src="https://github.com/user-attachments/assets/62841ad6-1d6b-4457-9ae3-26a98c6f3269" width="300">!

</p>

---

## Folder Structure
<p align="center">
   <img src= "https://github.com/user-attachments/assets/fdbdcea1-922d-43a3-9f33-445167c54c4e" width="300">

---

## ⚙️ Tech Stack

- **Flutter**: For building a responsive and cross-platform mobile application.
- **Repository Pattern**: For structured service calls.
- **MVVM Architecture**: Separation of concerns for better maintainability.
- **Shared Preference**: Theme persistance
- **GoRouter**: For navigation and named route management.
- **Provider**: For state management.
- **HTTP Package**: For making API calls.

---

## 🛠️ Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/shahriarRahmanShaon/star_wars_flutter_app.git
   cd star_wars_flutter_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

---
## ⚡ API Fetching, Pagination & Search

The **SWAPI Explorer** app integrates an efficient **data fetching, pagination, and search system** to provide users with a smooth browsing experience.

### 🌍 **API Fetching: How Data is Retrieved**
The app fetches character data from the **SWAPI API** using a well-structured architecture.

- The **`BaseService`** class acts as the **core API service**, handling HTTP requests and responses.
- The **`CharacterRemoteDataSourceImpl`** interacts with `BaseService` to request:
  - **Character data** (`fetchCharacters`)
  - **Film details** (`fetchFilms`)
  - **Homeworld information** (`fetchHomeworld`)
- The **`CharacterRepositoryImpl`** abstracts API logic, ensuring a **clean separation of concerns** and better maintainability.
- The **`HomeViewModel`** communicates with the repository to trigger API calls and manage UI updates.

This architecture ensures **modularity, reusability, and testability** across the application.

---

### 🔄 **Pagination: Handling Infinite Scrolling**
To enhance the browsing experience, the app implements **pagination**, allowing users to **load more characters dynamically** when scrolling.

- The SWAPI API provides a `next` field in its response, which contains the URL for the next page.
- The app **stores this `nextPageUrl`** and uses it when the user scrolls near the bottom.
- When `fetchMoreCharacters()` is triggered, it:
  - Sends a request to `nextPageUrl`
  - Appends new characters to the existing list
  - Updates `_nextPageUrl` for future requests
- This approach ensures **efficient data loading** without fetching unnecessary information all at once.

---

### 🔍 **Search: Dynamic & Optimized with Debounce**
To provide a **fast and optimized search experience**, the app implements a **debounce mechanism**.

- Instead of making an API request **on every keystroke**, the app **waits for 2 seconds** after the user stops typing before making a request.
- This is done using **a Timer**, which **cancels previous searches** if the user continues typing.
- If the user clicks the search button, an **instant search** is triggered.
- The API call uses SWAPI’s built-in **`?search=QUERY`** parameter, filtering results based on the input.

This technique significantly **reduces API requests**, improves app performance, and ensures a **smoother user experience**.

---

### ✅ **Summary of Key Functionalities**
✔ **Singleton API Service** (`BaseService`) manages network requests.  
✔ **Repository Pattern** ensures a modular and structured architecture.  
✔ **Pagination** dynamically loads more characters as the user scrolls.  
✔ **Debounced Search** optimizes API calls, reducing unnecessary network requests.  
✔ **Separation of Concerns** ensures easy maintenance and future scalability.  

With these features, the **SWAPI Explorer** app provides an efficient and enjoyable **Star Wars character browsing experience! 🚀🌌**

