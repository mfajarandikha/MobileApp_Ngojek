# 🛵 Ngojek App

**Ngojek** is a simple ride-hailing mobile app inspired by the UI/UX of **Gojek**. While it doesn’t implement full backend or ride features, it focuses on mimicking Gojek’s visual design and includes a **basic fare estimation** feature using Google Maps APIs.

---

## ✨ What It Does

- 🎨 Recreates the **UI/UX of Gojek**, including login and register page, homepage, and promo screens.
- 📍 Lets users select pickup and destination locations via **Google Maps**.
- 💰 **Estimates fare** using a simple formula based on distance.

---

## 💰 Fare Estimation Logic

The app uses the **Google Directions API** to calculate the distance between the pickup and drop-off points. The fare is calculated as:

```

Fare = Base Fare × Distance (in km)

````
> 📝 Note: No real-time pricing, time-based calculation, or surge pricing is applied.

---

## 🧰 Tech Stack

- **Framework:** Flutter
- **API:** Google Maps Places API + Directions API

---

## 📸 Screenshots

![image](https://github.com/user-attachments/assets/144eed7b-5d63-46c9-bfa0-dbc2bc472191)

---

## 📝 Disclaimer

This project is for **educational and UI practice purposes only**.
It is **not affiliated with or endorsed by Gojek**.
© 2025 Muhammad Fajar Andikha

```
