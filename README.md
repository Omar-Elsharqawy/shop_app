# 🛍️ Shop App

A modern shopping mobile application built with **Flutter & Dart**.

This project focuses on creating a simple shopping experience with product browsing and shopping cart management using **Bloc** state management.

## ✨ Features

- 🏠 Home page
- 📦 Display products
- 🔍 Product details
- 🛒 Add products to cart
- ➕ Increase product quantity
- ➖ Decrease product quantity
- 🗑️ Remove products from cart
- 💰 Calculate cart total price
- 🧩 Reusable custom widgets
- ⚡ State management using Bloc
- 📱 Clean and simple UI

## 🛠️ Technologies

- **Flutter**
- **Dart**
- **Flutter Bloc**
- **Material Design**

## 📂 Project Structure

```text
lib/
│
├── blocs/
│   └── cart_bloc/
│       ├── cart_bloc.dart
│       ├── cart_event.dart
│       └── cart_state.dart
│
├── models/
│   ├── cart_item.dart
│   └── product.dart
│
├── pages/
│   ├── cart_page.dart
│   ├── home_page.dart
│   └── product_details.page.dart
│
├── widgets/
│   ├── my_button.dart
│   ├── my_list_title.dart
│   └── my_text_title.dart
│
├── main.dart
└── root_screen.dart
```

## 🧠 State Management

The shopping cart is managed using **Bloc**.

The Bloc is divided into three main files:

- `cart_event.dart` — handles cart actions.
- `cart_state.dart` — manages the current cart state.
- `cart_bloc.dart` — contains the cart business logic.

## 📦 Models

### Product

Represents the products available in the shop.

### CartItem

Represents a product added to the shopping cart and its quantity.

## 📱 Main Screens

### 🏠 Home Page

Displays the available products.

### 📦 Product Details

Displays product information and allows the user to add a product to the cart.

### 🛒 Cart Page

Displays the selected products, quantities, and total price.

## 🎯 What I Learned

Through this project, I practiced:

- Building Flutter mobile applications
- Creating reusable widgets
- Working with Dart models
- Using Bloc for state management
- Separating business logic from UI
- Managing shopping cart operations
- Working with product quantities
- Calculating prices
- Organizing a Flutter project

## 🚀 Getting Started

Clone the repository and install the required dependencies:

```bash
git clone YOUR_REPOSITORY_URL
cd YOUR_PROJECT_NAME
flutter pub get
flutter run
```

## 👨‍💻 Author

**Omar Mohamed Elsharqawy**

Flutter Developer

⭐ If you like this project, feel free to give it a star!