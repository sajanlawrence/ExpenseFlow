# 💸 ExpenseFlow

**ExpenseFlow** is a modern iOS expense tracker app built using **SwiftUI**, **MVVM**, and **Core Data**, designed to help users track, analyze, and visualize their daily spending with ease.

---

## ✨ Features

- 📋 Add, edit, and delete expenses
- 🗂 Categorize expenses (Food, Travel, Shopping, Bills, Other)
- 🔍 Filter expenses
  - All
  - Today
  - This Month
  - By Category
- 📊 Interactive pie (donut) chart
  - Category-wise expense distribution
  - Total expense displayed at the center
- 📈 Statistics screen
- 🧾 Expense detail view
- 🧠 Smart empty states using `ContentUnavailableView`
- 🎨 Modern UI with glass (Material) effects
- 💾 Persistent storage using Core Data

---

## 🏗 Architecture

The app follows **MVVM (Model–View–ViewModel)** architecture.

---

## 📊 Charts & Analytics

- Built using **Swift Charts**
- Donut-style pie chart (`SectorMark`)
- Category-based color mapping
- Dynamic updates based on applied filters

---

## 🧠 Key Technologies

- SwiftUI
- Swift Charts
- Core Data
- MVVM
- Combine (where required)
- iOS 16+

---

## 🖼 UI Highlights

- Glassmorphism using `.ultraThinMaterial`
- Adaptive light and dark mode
- Native navigation with `NavigationStack`
- Swipe-to-delete support
- Clean, Apple-style UI

---

## 🚀 Future Enhancements

- Monthly and yearly analytics
- Budget limits and alerts
- Export expenses (CSV / PDF)
- iCloud sync
- iPad-optimized layout

---

## 🧑‍💻 Author

**Sajan Lawrence**  
iOS Developer | SwiftUI | UIKit | Core Data

---

## 📸 Screenshots

<table>
  <tr>
      <td align="center">
      <strong>Expense List</strong><br>
      <img src="Assets/pic1.png" alt="Expense List" width="250"/>
    </td>
      <td align="center">
      <strong>Expense List Dark Mode</strong><br>
      <img src="Assets/pic10.png" alt="Expense List Dark Mode" width="250"/>
    </td>
    <td align="center">
      <strong>Statistics View</strong><br>
      <img src="Assets/pic2.png" alt="Statistics" width="250"/>
    </td>
        <td align="center">
      <strong>Statistics View Dark Mode</strong><br>
      <img src="Assets/pic11.png" alt="Statistics View Dark Mode" width="250"/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <strong>Add Expense View</strong><br>
      <img src="Assets/pic7.png" alt="Add Expense View" width="250"/>
    </td>
    <td align="center">
      <strong>Add Expense View Dark Mode</strong><br>
      <img src="Assets/pic12.png" alt="Add Expense View" width="250"/>
    </td>
        <td align="center">
      <strong>No Expense View</strong><br>
      <img src="Assets/pic8.png" alt="No Expense View" width="250"/>
    </td>
            <td align="center">
      <strong>No Statistics View</strong><br>
      <img src="Assets/pic9.png" alt="No Statistics View" width="250"/>
    </td>
  </tr>
    <tr>
    <td align="center">
      <strong>Filter View</strong><br>
      <img src="Assets/pic5.png" alt="Filter View" width="250"/>
    </td>
    <td align="center">
      <strong>Edit View</strong><br>
      <img src="Assets/pic3.png" alt="Edit View" width="250"/>
    </td>
        <td align="center">
      <strong>Delete View</strong><br>
      <img src="Assets/pic4.png" alt="Delete View" width="250"/>
    </td>
            <td align="center">
      <strong>No Matching Filter View</strong><br>
      <img src="Assets/pic6.png" alt="No Matching Filter View" width="250"/>
    </td>
  </tr>
</table>
