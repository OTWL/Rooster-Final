# 🐓 Rooster_u - Time-Based Notification Scheduler

![Delphi](https://img.shields.io/badge/Delphi-FMX-blue.svg)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Android-green)
![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)

A **Delphi FireMonkey** application that schedules and manages time-based notifications. Users can define start and end times, and the app will calculate periods, send alerts, and handle notifications automatically.

---
## 📜 Documentaion link
None
 
---

## 🚀 Features
✅ **User-defined Start & End Times**  
✅ **Auto-Calculated Periods** (Adjusts dynamically)  
✅ **Smart Notifications** (Alerts before a period ends)  
✅ **Cancel Notifications Anytime**  
✅ **Cross-Platform Support** (Windows, Android)

---
## 📦 Installation  

### 🔹 Requirements  
- Delphi **FMX Framework**  
- Target Platform: **Windows, Android**  
- **Notification Permissions** enabled on the device  

### 🔹 Setup  
1. Clone the repository:  
   ```sh
   git clone https://github.com/yourusername/Rooster_u.git
   cd Rooster_u
   ```
2. Open the project in **Delphi IDE**  
3. Compile and run the application  

---

## 🎮 How to Use  

1️⃣ **Select a Start and End Time**  
2️⃣ Click **Submit** to generate periods & notifications  
3️⃣ Notifications will trigger automatically before periods end  
4️⃣ Click **Cancel** to clear all scheduled notifications  

---

## ⚙️ Key Components  

| Component | Type | Description |
|-----------|------|-------------|
| `TTimeEdit` | `tTimeStartPicker` | Selects the start time. |
| `TTimeEdit` | `tTimeEndPicker` | Selects the end time. |
| `TButton` | `btnSubmit` | Starts calculation & notifications. |
| `TMemo` | `TimeOutput` | Displays calculated periods. |
| `TNotificationCenter` | `NotificationCenter` | Manages system notifications. |

---

## 🛠️ Code Overview  

### `btnSubmitClick(Sender: TObject)`
- Captures the start and end times.
- Calls `DeterminePeriodLengths()` and `CalculateNotificationTimes()`.
- Sends notifications using `SendNoti()`.

### `DeterminePeriodLengths()`
- Divides the selected time range into **9 periods**.
- Handles a **break time** in the 6th period.

### `CalculateNotificationTimes()`
- Computes notification times before the period ends.

### `SendNoti()`
- Creates and schedules **system notifications**.

### `BtnCancelClick(Sender: TObject)`
- Cancels all scheduled notifications.

---

## 📜 License  
This project is **MIT Licensed**. Feel free to use, modify, and distribute it.

---

## 🤝 Contributing  
💡 Found a bug? Have a feature request? Feel free to submit a pull request!  

---

## 📬 Contact  
🔗 **OTWL:** [github.com/OTWL](https://github.com/OTWL) <br />
🔗 **LinkedIn:** [LinkedIn](https://www.linkedin.com/in/christian-h-23869b28b/)
